import pandas as pd
import numpy as np
import copy
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from sklearn.linear_model import ElasticNet
import matplotlib.patches as patches
import matplotlib.patches as mpatches

def split_dataset(genotype, phenotype, trait, test=0.2):
    train, test = train_test_split(phenotype.Line.values, test_size=0.2, random_state=1)
    train = np.sort(train); test = np.sort(test)
    test_genotype = genotype.loc[:, test]
    test_phenotype = phenotype[phenotype.Line.isin(test)]
    train_genotype = genotype.loc[:, train]
    train_phenotype = phenotype[phenotype.Line.isin(train)]
    return test_genotype, test_phenotype, train_genotype, train_phenotype

def make_genomic_prediction_model(train_genotype, train_phenotype, phenotype):
    
    X_train = train_genotype.T.fillna(1)
    y_train = train_phenotype[phenotype].values
    if phenotype == "LW_mean":
        alpha=0.02
        l1_ratio=0.1
    else:
        alpha=0.5
        l1_ratio=0.3
    clf = ElasticNet(alpha=alpha, l1_ratio=l1_ratio)
    clf.fit(X_train, y_train)
    # coefs = clf.coef_
    return clf

def check_equation(trait, prediction_model):
    equation = "{} = {} + ".format(trait, prediction_model.intercept_)
    for i, j in enumerate(prediction_model.coef_):
        if j != 0:
            equation += "SNP{}×{} + ".format(str(i), str(j))
    return equation

def predict_phenotype(test_genotype, prediction_model):
    y_test_pred = prediction_model.predict(test_genotype.T.fillna(1))
    return y_test_pred

def check_accuracy(predicted_test_phenotype, test_phenotype, trait):
    
    print("Correlation coefficient:", np.corrcoef([predicted_test_phenotype, test_phenotype[trait].values])[0,1])
    sns.set()
    plt.scatter(predicted_test_phenotype, test_phenotype[trait].values)
    plt.xlabel("predicted {}".format(trait))
    plt.ylabel("observed {}".format(trait))
    plt.show()

def show_estimated_SNP_effect(prediction_model):
    sns.set()
    plt.plot(prediction_model.coef_)
    plt.show()

def predict_progeny_phenotype(Line1, Line2, progeny, genotype, prediction_model):

    print("If we cross {} & {}, the phenotype of F2 population may be...".format(Line1, Line2))

    progenies = []

    for k in range(progeny):
        a = np.arange(len(genotype[Line1].values))
        a = np.random.permutation(a)[:len(genotype[Line1].values)//100]
        a.sort()

        if np.random.rand() > 0.5:
            new = copy.copy(genotype[Line1].values)
            other = copy.copy(genotype[Line2].values)
        else:
            new = copy.copy(genotype[Line2].values)
            other = copy.copy(genotype[Line1].values)

        for i in range(len(a)//2):
            new[a[i*2]:a[i*2+1]] = other[a[i*2]:a[i*2+1]]
        
        new[new < 0] = 0
        progenies.append(new)
    progenies_genotype = pd.DataFrame(progenies).T

    pred = predict_phenotype(progenies_genotype, prediction_model)
    sns.set()
    plt.hist(pred)
    plt.show()

def predict_customized_genotype(genotype, selected_chrs, prediction_model):
    trait = "GN"
    fig = plt.figure(figsize=(5,12))
    ax = plt.axes()

    for i, each_chr in enumerate(genotype.chr.unique()):
        chr_genotype = genotype[genotype["chr"] == each_chr]
        end = chr_genotype.iloc[-1, :].pos
        r = patches.Rectangle(xy=(i*12000000, 18000000), width=5000000, height=-end*3, ec='gray', fc="orange", linewidth=3)
        ax.add_patch(r)
        if i == 0:
            plt.text(-10000000, 20000000, "chr {}".format(i+1))
        else:
            plt.text(i*12000000, 20000000, str(i+1))

    r = patches.Rectangle(xy=(75000000, -1*100000000), width=3000000*3, height=5000000, ec='gray', fc="orange", linewidth=3)
    ax.add_patch(r)
    plt.text(40000000, -1*100000000, "Hitomebore")
    r = patches.Rectangle(xy=(117000000, -1*100000000), width=3000000*3, height=5000000, ec='gray', fc="blue", linewidth=3)
    ax.add_patch(r)
    plt.text(87000000, -1*100000000, "REXMONT")

    for each_chr in selected_chrs:
        i = int(each_chr[3:]) - 1
        chr_genotype = genotype[genotype["chr"] == each_chr]
        end = chr_genotype.iloc[-1, :].pos
        r = patches.Rectangle(xy=(i*12000000, 18000000), width=5000000, height=-end*3, ec='gray', fc="blue", linewidth=3)
        ax.add_patch(r)

    plt.axis('scaled')
    plt.axis('off')
    plt.tight_layout()
    ax.set_aspect('equal')

    plt.show()

    customized_genotype = np.repeat(0, genotype.shape[0])
    customized_genotype[genotype.chr.isin(selected_chrs).values] = 2

    print("\n")
    print("The cultivar of this genotype showed...")
    print(trait, "=", '\033[1m'+"{}".format(predict_phenotype(pd.DataFrame(customized_genotype), prediction_model)[0])+'\033[0m')
    print("※", trait, "of Hitomebore is", '\033[1m'+"{}".format(predict_phenotype(pd.DataFrame(np.repeat(0, genotype.shape[0])), prediction_model)[0])+'\033[0m')
    