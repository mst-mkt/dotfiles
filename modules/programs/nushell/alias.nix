{ delib, ... }:

delib.module {
  name = "programs.nushell";

  home.ifEnabled.programs.nushell.shellAliases = {
    # git
    s = "git status";

    l = "git log --oneline --graph --decorate";
    l1 = "git log --oneline --graph --decorate -1";
    l2 = "git log --oneline --graph --decorate -2";
    l3 = "git log --oneline --graph --decorate -3";
    l4 = "git log --oneline --graph --decorate -4";
    l5 = "git log --oneline --graph --decorate -5";
    l6 = "git log --oneline --graph --decorate -6";
    l7 = "git log --oneline --graph --decorate -7";
    l8 = "git log --oneline --graph --decorate -8";
    l9 = "git log --oneline --graph --decorate -9";
    l10 = "git log --oneline --graph --decorate -10";

    sw = "git switch";
    swc = "git switch -c";

    ga = "git add";
    gan = "git add -N";
    gap = "git add -p";

    gb = "git branch";
    gbd = "git branch -D";
    gbm = "git branch -M";

    gc = "git commit -m";
    gca = "git commit --amend --no-edit";
    gcam = "git commit --amend -m";
    gcn = "git commit --no-verify -m";

    gcp = "git cherry-pick";
    gcpa = "git cherry-pick --abort";
    gcpc = "git cherry-pick --continue";
    gcps = "git cherry-pick --skip";

    gd = "git diff";
    gdh = "git diff HEAD";
    gds = "git diff --staged";

    gf = "git fetch";
    gfo = "git fetch origin";
    gfp = "git fetch --prune";

    gini = "git init";

    gm = "git merge";
    gma = "git merge --abort";
    gmc = "git merge --continue";
    gmfh = "git merge FETCH_HEAD";

    gpl = "git pull";
    gplo = "git pull origin";
    gplom = "git pull origin main";

    gps = "git push";
    gpso = "git push origin";
    gpsom = "git push origin main";

    grb = "git rebase";
    grba = "git rebase --abort";
    grbc = "git rebase --continue";
    grbi = "git rebase -i";
    grbs = "git rebase --skip";

    gre = "git restore";
    gus = "git restore --staged";

    grf = "git reflog";

    grh = "git reset --hard";
    grs = "git reset --soft";
    grx = "git reset --mixed";

    grm = "git remote";
    grma = "git remote add";
    grms = "git remote set-url";
    grmv = "git remote -v";

    grv = "git revert";
    grva = "git revert --abort";
    grvc = "git revert --continue";

    gs = "git stash";
    gsd = "git stash drop";
    gsp = "git stash pop";
    gsu = "git stash -u";

    gt = "git tag";
    gtd = "git tag -d";
    gtp = "git push --tags";
  };
}
