{ delib, ... }:

delib.module {
  name = "programs.nushell";

  home.ifEnabled.programs.nushell.shellAliases = {
    # git
    s = "git status";

    l = "git log";
    l1 = "git log -1";
    l2 = "git log -2";
    l3 = "git log -3";
    l4 = "git log -4";
    l5 = "git log -5";
    l6 = "git log -6";
    l7 = "git log -7";
    l8 = "git log -8";
    l9 = "git log -9";
    l10 = "git log -10";

    lo = "git log --oneline";
    lo1 = "git log --oneline -1";
    lo2 = "git log --oneline -2";
    lo3 = "git log --oneline -3";
    lo4 = "git log --oneline -4";
    lo5 = "git log --oneline -5";
    lo6 = "git log --oneline -6";
    lo7 = "git log --oneline -7";
    lo8 = "git log --oneline -8";
    lo9 = "git log --oneline -9";
    lo10 = "git log --oneline -10";

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

    gd = "hunk diff";
    gdh = "hunk diff HEAD";
    gds = "hunk diff --staged";

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

    gps = "git push";
    gpso = "git push origin";

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

    # claude code
    "/new" = "claude";
  };
}
