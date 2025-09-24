import igv_notebook

def RefTrack(track_info, locus=None):
    ref ={"reference": {**{"id":"Reference"}, **track_info}, "locus": locus}
    return ref

def BamTrack(track_info):
    base = {"name":None, "type":"alignment", "format":"bam"}
    bam = {**base, **track_info}
    return bam

def AnnotationTrack(track_info):
    base = {"name":None, "type":"annotation", "format":"gff"}
    bam = {**base, **track_info}
    return bam
    