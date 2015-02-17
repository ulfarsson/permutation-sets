def tableau_contains_shape(tab, sh):
    '''
    Return True if the tableaux tab contains the shape sh
    '''
    tab_sh = tab.shape()

    lsh = len(sh)

    if len(tab_sh) < lsh:
        return False

    for i in range(lsh):
        if sh[i] > tab_sh[i]:
            return False

    return True