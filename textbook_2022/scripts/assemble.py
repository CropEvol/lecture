import numpy as np
import networkx as nx
from random import randint
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator
from Bio import SeqIO

## Fastaから指定範囲のシーケンスを抽出する
def GetSubseq(seq, chrom=None, start=None, end=None):
    for rec in SeqIO.parse(seq, "fasta"):
        if chrom is None:
                cseq = rec.seq
                break
        else:
                if chrom == rec.id:
                        cseq = rec.seq
                        break
    if start is None:
        start = 1
    if end is None:
        end = len(cseq)
    subseq = cseq[start-1:end]
    return str(subseq)

## シーケンシングリードの分布
def make_data_for_read_distplot(pos, read_length):
    x = np.sort(pos)
    y = []
    y_anchor_init = 0.1
    y_anchor = y_anchor_init
    x_anchor = x[0]
    for v in x:
        ## リードが重ならない位置で、y軸の値を戻す
        if v > x_anchor + read_length+3:
            x_anchor = v
            y_anchor = y_anchor_init
        y.append(y_anchor)
        y_anchor += y_anchor_init
    x_end = x + read_length
    y = np.array(y)
    return x, x_end, y

def draw_read_distplot(ax, x_start, x_end, y, genome):
    ax.hlines(y, x_start, x_end, color="orange", alpha=0.8)
    ax.set_xlim(0, len(genome))
    ax.set_ylim(0, y.max()*1.05)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_visible(False)
    ax.set_xlabel("Positoin (bp)", fontsize=14)
    ax.set_yticks([])
    ax.tick_params(axis='x', labelsize=12)
    ax.xaxis.set_major_locator(MaxNLocator(integer=True))

## 与えられたシーケンスを元に、リードを作成する（Output: fasta形式）
def Sequencing(genome, read_length=5, n_reads=10, output="reads.fa", verbose=False, draw=False):
    ## 範囲外の入力値への対応
    if read_length < 1:
        read_length = 1
    genome_length = len(genome)
    if read_length > genome_length:
        read_length = genome_length
    pos_limit = genome_length - read_length
    ## リードのサンプリング
    read_pos = []
    read_str = []
    with open(output, mode="w") as fout:
        for i in range(n_reads):
            ## リードの位置情報
            p = randint(0, pos_limit) 
            read_pos.append(p)
            ## fasta形式出力
            read_name = ">read_%d" % (i+1)
            read_seq    = genome[p:p+read_length]
            read_str.append(read_seq)
            fout.write("%s\n" % read_name)
            fout.write("%s\n" % read_seq)
    ## 情報出力
    if verbose:
        print("Output:")
        print("- Read length: {:,d}".format(read_length))
        print("- Number of reads: {:,d}".format(n_reads))
        print("- File: {:s}".format(output))
    ## リードの分布
    if draw:
        fig = plt.figure()
        ## リードの分布図（上図）
        ax = fig.add_subplot(111)
        x, x_end, y = make_data_for_read_distplot(read_pos, read_length)
        draw_read_distplot(ax, x, x_end, y, genome)
        ## 描画
        fig.tight_layout()
        plt.show()

## fastaファイル中のリードのパターン（ユニークな配列パターン）を得る
def ReadPatterns(fasta_file):
    seqs = []
    for rec in SeqIO.parse(fasta_file, "fasta"):
        seqs.append(str(rec.seq))
    seq_patterns = sorted(list(set(seqs)))
    return seq_patterns

## 与えられたシーケンスのprefix
def Prefix(seq, k):
    return seq[:k]

## 与えられたシーケンスのsuffix
def Suffix(seq, k):
    return seq[-k:]

## リードパターンからDeBruijnグラフ（隣接リスト）を作成する
def DeBruijn(patterns, k=None):
    ## 不適なkの値の調整
    min_seq_length = min([len(p) for p in patterns])
    if k is None:
        k = min_seq_length-1
    if k > min_seq_length:
        k = min_seq_length-1
    if k < 0:
        k = 0
    adjacency_list = []
    for p in patterns:
        node_from = Prefix(seq=p, k=k)
        node_to     = Suffix(seq=p, k=k)
        adjacency_list.append([node_from, node_to])
    return adjacency_list

## DeBruijnグラフ（隣接リスト）からEulerianパスがあるかどうかを調べる
def has_Eulerian_or_not(adjacency_list):
    G = nx.DiGraph()
    G.add_edges_from(adjacency_list)
    return nx.has_eulerian_path(G)

## DeBruijnグラフ（隣接リスト）からEulerianパスを得る
def EulerianPath(adjacency_list):
    G = nx.DiGraph()
    G.add_edges_from(adjacency_list)
    path = []
    for u, v in nx.eulerian_path(G):
        path.append(u)
    path.append(v)
    return path

## Eulerianパスからシーケンスを
def EulerianPath_to_Sequence(path):
    seq = path[0]
    for i in range(1, len(path)):
        seq = seq + path[i][-1:]
    return seq

## DeBruijnグラフ（隣接リスト）からグラフ
def DrawPath(adjacency_list, random_seed=3068):
    G = nx.DiGraph()
    G.add_edges_from(adjacency_list)
    pos = nx.spring_layout(G, seed=random_seed)
    nx.draw(G, pos=pos, with_labels=True)
    nx.draw_networkx_edge_labels(G)

## edgeの位置情報
def edge_positon(path):
    i = 0
    pos = {}
    for p in path:
        if not p in pos.keys():
                pos[p] = (i,i)
                i += 1
    return pos

## DeBruijnグラフ（隣接リスト）からグラフ
def DrawPath(adjacency_list, pos=None, label=True):
    ## グラフ描画
    G = nx.DiGraph()
    G.add_edges_from(adjacency_list)
    if pos is None:
        pos = nx.spring_layout(G, seed=1)
    if label:
        nx.draw(G, pos=pos, with_labels=True)
    else:
        nx.draw(G, pos=pos, with_labels=False)

## リード（Fasta形式）からアセンブル配列を構築する
def RunAssemble(fasta_file, draw_graph=False):
        patterns = ReadPatterns(fasta_file)
        adj_list = DeBruijn(patterns)
        assembled_seq = None
        if has_Eulerian_or_not(adj_list):
                path = EulerianPath(adj_list)
                edge_pos = edge_positon(path)
                if draw_graph:
                        DrawPath(adj_list, pos=edge_pos, label=True)
                assembled_seq = EulerianPath_to_Sequence(path)
        else:
                if draw_graph:
                        DrawPath(adj_list, label=False)
        return assembled_seq
