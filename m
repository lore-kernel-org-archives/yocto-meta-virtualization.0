Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0548C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 09:32:41 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.17451.1693906352805931293
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 02:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AVMWDUW4;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-45070739316so97427137.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693906351; x=1694511151; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JBxys3nLQtOtX8t+JZWxvWtDVj/WMhlwvrNYWZYFzAw=;
        b=AVMWDUW4s0hk6mdopStTp0EUNzmENAw4WY+lSIo4qSp9wGKnHJZPJYKca7wsLRigr1
         0sdU8Rywjo5rbOHa3vw7skMFBebTWWH14IEScgIHqmYxYpeiIJxQeLNoquaYNREcUqZ+
         Tv7L8mMF/l9eeTOM2yhFM0zD8DBIPXtV5kW3MTh6iJBy+FKHkMg7TOtGRNEIVJZbU3uo
         wD2g4Uik6qZ2+6nGyMGa/53pvg2IaZ5rKv8WSeitRPQFT3EM8Ua39hvvmkVHt/+xyuxr
         zC+NPfa7nj8UugrzhUsA7dCeTzt83UR3lLuRlRxttV0gdAXHvFcehaM9RPmaDraJ4mFi
         ORRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693906351; x=1694511151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBxys3nLQtOtX8t+JZWxvWtDVj/WMhlwvrNYWZYFzAw=;
        b=k5OriACRvCDmG4jRHC1Vgx18TxJvnEmjTqI2UvZiciMgnJU6gvsnTQg1HrNWYZL+IB
         eoxBOGEdyBUNlOAOsscxGe+H0dILQSmi+yRAeQCCL4/drZBadOfpMPXkqs2YrnICs54U
         aTjr60xjersuukGsLsGEsHXIs71Xt8blpbccmkgoaT154Iqj7MerXqlkZVkSqr1n6g2O
         DdVoLdzwBpsomtmz2UJwULomAXowJqTI9GHWiql6mZ4Zm+ynYQxwNR1vD1vAtvP7VyZL
         0xt+B6dO2h7fDfVJZvy1sd6Mjbqf3mZhz+oWLSvrmCkzGBYwJSRyaQKYlaru3rq2wr4M
         0y1A==
X-Gm-Message-State: AOJu0YzpQDOFrro0aH9YGt50zqM9wxrCoC8lxCx66V0abLide5KNXlX6
	d9JgXnRLex3f0Ho19w/1fz7whDJqekgIL5Kka1wZXfJncxc=
X-Google-Smtp-Source: AGHT+IG293Ez3rS31HjTSUTmT5Wdh+f8uKyIwiF88g3/91ShJcH2Ul30p04zw60/S+r7/5mKPPg1dSn+MI1LP80w1P0=
X-Received: by 2002:a67:f947:0:b0:44d:5718:d72a with SMTP id
 u7-20020a67f947000000b0044d5718d72amr10437045vsq.11.1693906350549; Tue, 05
 Sep 2023 02:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
In-Reply-To: <20230905032203.1896328-1-Qi.Chen@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 5 Sep 2023 10:32:19 +0100
Message-ID: <CANPvuRmQEz=Hh6bSkdRj=ZT7v7R0S-J+14g=8i=YC2fNzd-rZQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] oe-go-mod-autogen.py: add script
 to help adding/upgrading go mod recipes
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004eafb40604994efb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 09:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8275

--0000000000004eafb40604994efb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chen Qi via lists.yoctoproject.org <Qi.Chen=3D
windriver.com@lists.yoctoproject.org> escreveu no dia ter=C3=A7a, 5/09/2023=
 =C3=A0(s)
04:22:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> oe-go-mod-autogen.py is a helper script for go mod recipes. It follows
> Bruce's initiative about how to deal with go mod recipes in OE.
>

Place the below description on some README file or commented itself inside
the script can be useful for others.

Jose

Example:
> cmd: <path_to>/meta-virtualization/scripts/oe-go-mod-autogen.py \
>      --repo https://github.com/docker/compose --rev v2.20.3
> output: src_uri.inc, relocation.inc, modules.txt
>
> Copy these three generated files to replace the original ones,
> then we only need update PV and SRCREV, and docker-compose is upgraded.
>
> Below are some technical details.
>
> * get module's repo from module name
>
>   This script checks the following two URLs to determine the module's rep=
o.
>   1. https://<module_name_tweaked>?=3Dgo-get=3D1
>   2. https://pkg.go.dev/<module_name_tweaked>
>
>   The module_name_tweaked is derived from module_name, with the last
> components
>   removed one by one. Let me use two examples to explain this.
>
>   For module_name sigs.k8s.io/json, the sigs.k8s.io/json is first used as
>   module_name_tweaked for searching. And we can correctly get the repo
> URL, so
>   the search stops.
>
>   For module_name github.com/k3s-io/etcd/api/v3, the following ones are
> used
>   as module_name_tweaked:
>   github.com/k3s-io/etcd/api/v3
>   github.com/k3s-io/etcd/api
>   github.com/k3s-io/etcd
>   And when searching 'github.com/k3s-io/etcd', we get the repo URL, so
> the search
>   stops.
>
> * determine the srcdir:destdir mapping in 'vendor' creation
>
>   To correctly form the 'vendor' directory, the mapping is critical.
>   This script makes use of tag matching and path matching to determine
>   the subpath in the repo for the module.
>
> * avoid subpath being overriden by parent path
>
>   We need to avoid subpath being overriden by parent path. This is needed
>   for both SRC_URI ordering in src_uri.inc and the sites mapping ordering
>   in relocation.inc. This script simply uses the length as the ordering
> key,
>   simply for the reason that if a path is a subpath of another path, it
> must
>   be longer.
>
> * the .git suffix is removed to sync with each other
>
>   Unlike normal recipes, go mod recipe usually have many SRC_URIs. This
> script
>   remove the '.git' suffix from repo URL so that the repo URLs are in syn=
c
>   with each.
>
> * basic directory hierarchy and caching mechanism
>
>   <cwd>/repos: hold the repos downloaded and checked
>   <cwd>/wget-contents: hold the contents to determine the module's repo
>   <cwd>/wget-contents/<module_name>.repo_url.cache: the repo value cache
>   This is to avoid unnecessary URL fetching and repo cloning.
>
> * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script
>
>   The script must get the correct repo_url, fullsrc_rev and subpath for
>   each required module in go.mod to correctly generate the src_uri.inc an=
d
>   relocation.inc files. If this process fails for any required module, th=
is
>   script stop immediately, as I deliberately set
> ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE
>   to True in this script. The purpose is to encourage people to report
>   problems to meta-virt so that we can improve this script according to
>   these feedbacks. But this variable can set to False, then the script
>   only records the failed modules in self.modules_unhandled with reasons
>   added, people can modify the generated src_uri.inc and relocation.inc
>   to manually handle these unhandled modules if they are urgent to
>   add/upgrade some go mod recipes.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/oe-go-mod-autogen.py | 663 +++++++++++++++++++++++++++++++++++
>  1 file changed, 663 insertions(+)
>  create mode 100755 scripts/oe-go-mod-autogen.py
>
> diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-autogen.py
> new file mode 100755
> index 00000000..09d6133b
> --- /dev/null
> +++ b/scripts/oe-go-mod-autogen.py
> @@ -0,0 +1,663 @@
> +#!/usr/bin/env python3
> +
> +import os
> +import sys
> +import logging
> +import argparse
> +from collections import OrderedDict
> +import subprocess
> +
> +# This switch is used to make this script error out ASAP, mainly for
> debugging purpose
> +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True
> +
> +logger =3D logging.getLogger('oe-go-mod-autogen')
> +loggerhandler =3D logging.StreamHandler()
> +loggerhandler.setFormatter(logging.Formatter("%(levelname)s:
> %(message)s"))
> +logger.addHandler(loggerhandler)
> +logger.setLevel(logging.INFO)
> +
> +class GoModTool(object):
> +    def __init__(self, repo, rev, workdir):
> +        self.repo =3D repo
> +        self.rev =3D rev
> +        self.workdir =3D workdir
> +
> +        # Stores the actual module name and its related information
> +        # {module: (repo_url, repo_dest_dir, fullsrcrev)}
> +        self.modules_repoinfo =3D {}
> +
> +        # {module_name: (url, version, destdir, fullsrcrev)}
> +        #
> +        # url: place to get the source codes, we only support git repo
> +        # version: module version, git tag or git rev
> +        # destdir: place to put the fetched source codes
> +        # fullsrcrev: full src rev which is the value of SRC_REV
> +        #
> +        # e.g.
> +        # For 'github.com/Masterminds/semver/v3 v3.1.1' in go.mod:
> +        # module_name =3D github.com/Masterminds/semver/v3
> +        # url =3D https://github.com/Masterminds/semver
> +        # version =3D v3.1.1
> +        # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/
> github.com/Masterminds/semver/v3
> +        # fullsrcrev =3D d387ce7889a157b19ad7694dba39a562051f41b0
> +        self.modules_require =3D OrderedDict()
> +
> +        # {orig_module: (actual_module, actual_version)}
> +        self.modules_replace =3D OrderedDict()
> +
> +        # Unhandled modules
> +        self.modules_unhandled =3D OrderedDict()
> +
> +        # store subpaths used to form srcpath
> +        # {actual_module_name: subpath}
> +        self.modules_subpaths =3D OrderedDict()
> +
> +        # modules's actual source paths, record those that are not the
> same with the module itself
> +        self.modules_srcpaths =3D OrderedDict()
> +
> +        # store lines, comment removed
> +        self.require_lines =3D []
> +        self.replace_lines =3D []
> +
> +        # fetch repo
> +        self.fetch_and_checkout_repo(self.repo.split('://')[1],
> self.repo, self.rev, checkout=3DTrue, get_subpath=3DFalse)
> +
> +    def show_go_mod_info(self):
> +        # Print modules_require, modules_replace and modules_unhandled
> +        print("modules required:")
> +        for m in self.modules_require:
> +            url, version, destdir, fullrev =3D self.modules_require[m]
> +            print("%s %s %s %s" % (m, version, url, fullrev))
> +
> +        print("modules replace:")
> +        for m in self.modules_replace:
> +            actual_module, actual_version =3D self.modules_replace[m]
> +            print("%s =3D> %s %s" % (m, actual_module, actual_version))
> +
> +        print("modules unhandled:")
> +        for m in self.modules_unhandled:
> +            reason =3D self.modules_unhandled[m]
> +            print("%s unhandled: %s" % (m, reason))
> +
> +    def parse(self):
> +        # check if this repo needs autogen
> +        repo_url, repo_dest_dir, repo_fullrev =3D
> self.modules_repoinfo[self.repo.split('://')[1]]
> +        if os.path.isdir(os.path.join(repo_dest_dir, 'vendor')):
> +            logger.info("vendor direcotry has already existed for %s, no
> need to add other repos" % self.repo)
> +            return
> +        go_mod_file =3D os.path.join(repo_dest_dir, 'go.mod')
> +        if not os.path.exists(go_mod_file):
> +            logger.info("go.mod file does not exist for %s, no need to
> add otehr repos" % self.repo)
> +            return
> +        self.parse_go_mod(go_mod_file)
> +        self.show_go_mod_info()
> +
> +    def fetch_and_checkout_repo(self, module_name, repo_url, rev,
> default_protocol=3D'https://', checkout=3DFalse, get_subpath=3DTrue):
> +        """
> +        Fetch repo_url to <workdir>/repos/repo_base_name
> +        """
> +        protocol =3D default_protocol
> +        if '://' in repo_url:
> +            repo_url_final =3D repo_url
> +        else:
> +            repo_url_final =3D default_protocol + repo_url
> +        logger.debug("fetch and checkout %s %s" % (repo_url_final, rev))
> +        repos_dir =3D os.path.join(self.workdir, 'repos')
> +        if not os.path.exists(repos_dir):
> +            os.makedirs(repos_dir)
> +        repo_basename =3D repo_url.split('/')[-1].split('.git')[0]
> +        repo_dest_dir =3D os.path.join(repos_dir, repo_basename)
> +        module_last_name =3D module_name.split('/')[-1]
> +        git_action =3D "fetch"
> +        if os.path.exists(repo_dest_dir):
> +            if checkout:
> +                # check if current HEAD is rev
> +                try:
> +                    headrev =3D subprocess.check_output('git rev-list -1
> HEAD', shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
> +                    requiredrev =3D subprocess.check_output('git rev-lis=
t
> -1 %s 2>/dev/null || git rev-list -1 %s/%s' % (rev, module_last_name, rev=
),
> shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
> +                    if headrev =3D=3D requiredrev:
> +                        logger.info("%s has already been fetched and
> checked out as required, skipping" % repo_url)
> +                        self.modules_repoinfo[module_name] =3D (repo_url=
,
> repo_dest_dir, requiredrev)
> +                        return
> +                    else:
> +                        logger.info("HEAD of %s is not %s, will do a
> clean clone" % (repo_dest_dir, requiredrev))
> +                        git_action =3D "clone"
> +                except:
> +                    logger.info("'git rev-list' in %s failed, will do a
> clean clone" % repo_dest_dir)
> +                    git_action =3D "clone"
> +            else:
> +                # determine if the current repo points to the desired
> remote repo
> +                try:
> +                    remote_origin_url =3D subprocess.check_output('git
> config --get remote.origin.url', shell=3DTrue,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> +                    if remote_origin_url.endswith('.git'):
> +                        if not repo_url_final.endswith('.git'):
> +                            remote_origin_url =3D remote_origin_url[:-4]
> +                    else:
> +                        if repo_url_final.endswith('.git'):
> +                            remote_origin_url =3D remote_origin_url + '.=
git'
> +                    if remote_origin_url !=3D repo_url_final:
> +                        logger.info("remote.origin.url for %s is not %s,
> will do a clean clone" % (repo_dest_dir, repo_url_final))
> +                        git_action =3D "clone"
> +                except:
> +                    logger.info("'git config --get remote.origin.url' in
> %s failed, will do a clean clone" % repo_dest_dir)
> +                    git_action =3D "clone"
> +        else:
> +            # No local repo, clone it.
> +            git_action =3D "clone"
> +
> +        if git_action =3D=3D "clone":
> +            logger.info("Removing %s" % repo_dest_dir)
> +            subprocess.check_call('rm -rf %s' % repo_dest_dir, shell=3DT=
rue)
> +
> +        # clone/fetch repo
> +        try:
> +            git_cwd =3D repos_dir if git_action =3D=3D "clone" else
> repo_dest_dir
> +            logger.info("git %s %s in %s" % (git_action, repo_url_final,
> git_cwd))
> +            subprocess.check_call('git %s %s >/dev/null 2>&1' %
> (git_action, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)
> +        except:
> +            logger.warning("Failed to %s %s in %s" % (git_action,
> repo_url_final, git_cwd))
> +            return
> +
> +        def get_requiredrev(get_subpath):
> +            import re
> +            # check if rev is a revision or a version
> +            if len(rev) =3D=3D 12 and re.match('[0-9a-f]+', rev):
> +                rev_is_version =3D False
> +            else:
> +                rev_is_version =3D True
> +
> +            # if rev is not a version, 'git rev-list -1 <rev>' should
> just succeed!
> +            if not rev_is_version:
> +                try:
> +                    rev_return =3D subprocess.check_output('git rev-list=
 -1
> %s 2>/dev/null' % rev, shell=3DTrue,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> +                    if get_subpath:
> +                        cmd =3D 'git branch -M toremove && git checkout =
-b
> check_subpath %s && git branch -D toremove' % rev_return
> +                        subprocess.check_call(cmd, shell=3DTrue,
> cwd=3Drepo_dest_dir)
> +                        # try to get the subpath for this module
> +                        module_name_parts =3D module_name.split('/')
> +                        while (len(module_name_parts) > 0):
> +                            subpath =3D '/'.join(module_name_parts)
> +                            dir_to_check =3D repo_dest_dir + '/' +
> '/'.join(module_name_parts)
> +                            if os.path.isdir(dir_to_check):
> +                                self.modules_subpaths[module_name] =3D
> subpath
> +                                break
> +                            else:
> +                                module_name_parts.pop(0)
> +                    return rev_return
> +                except:
> +                    logger.warning("Revision (%s) not in repo(%s)" %
> (rev, repo_dest_dir))
> +                    return None
> +
> +            # the following codes deals with case where rev is a version
> +            # determine the longest match tag, in this way, we can get
> the current srcpath to be used in relocation.inc
> +            # we first get the initial tag, which is formed from
> module_name and rev
> +            module_parts =3D module_name.split('/')
> +            if rev.startswith(module_parts[-1] + '.'):
> +                tag =3D '/'.join(module_parts[:-1]) + '/' + rev
> +                last_module_part_replaced =3D True
> +            else:
> +                tag =3D '/'.join(module_parts) + '/' + rev
> +                last_module_part_replaced =3D False
> +            logger.debug("use %s as the initial tag for %s" % (tag,
> module_name))
> +            tag_parts =3D tag.split('/')
> +            while(len(tag_parts) > 0):
> +                try:
> +                    rev_return =3D subprocess.check_output('git rev-list=
 -1
> %s 2>/dev/null' % tag, shell=3DTrue,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> +                    if len(tag_parts) > 1:
> +                        # ensure that the subpath exists
> +                        if get_subpath:
> +                            cmd =3D 'git branch -M toremove && git check=
out
> -b check_subpath %s && git branch -D toremove' % rev_return
> +                            subprocess.check_call(cmd, shell=3DTrue,
> cwd=3Drepo_dest_dir)
> +                            # get subpath for the actual_module_name
> +                            if last_module_part_replaced:
> +                                subpath =3D '/'.join(tag_parts[:-1]) + '=
/'
> + module_parts[-1]
> +                                if not os.path.isdir(repo_dest_dir + '/'
> + subpath):
> +                                    subpath =3D '/'.join(tag_parts[:-1])
> +                            else:
> +                                subpath =3D '/'.join(tag_parts[:-1])
> +                            if not os.path.isdir(repo_dest_dir + '/' +
> subpath):
> +                                logger.warning("subpath (%s) derived fro=
m
> tag matching does not exist in %s" % (subpath, repo_dest_dir))
> +                                return None
> +                            self.modules_subpaths[module_name] =3D subpa=
th
> +                            logger.info("modules_subpath[%s] =3D %s" %
> (module_name, subpath))
> +                    return rev_return
> +                except:
> +                    tag_parts.pop(0)
> +                    tag =3D '/'.join(tag_parts)
> +            logger.warning("No tag matching %s" % rev)
> +            return None
> +
> +        requiredrev =3D get_requiredrev(get_subpath)
> +        if requiredrev:
> +            logger.info("Got module(%s) requiredrev: %s" % (module_name,
> requiredrev))
> +            if checkout:
> +                subprocess.check_call('git checkout -b gomodautogen %s' =
%
> requiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)
> +            self.modules_repoinfo[module_name] =3D (repo_url,
> repo_dest_dir, requiredrev)
> +        else:
> +            logger.warning("Failed to get requiredrev, repo_url =3D %s, =
rev
> =3D %s, module_name =3D %s" % (repo_url, rev, module_name))
> +
> +    def parse_go_mod(self, go_mod_path):
> +        """
> +        Parse go.mod file to get the modules info
> +        """
> +        # First we get the require and replace lines
> +        # The parsing logic assumes the replace lines come *after* the
> require lines
> +        inrequire =3D False
> +        inreplace =3D False
> +        with open(go_mod_path, 'r') as f:
> +            lines =3D f.readlines()
> +            for line in lines:
> +                if line.startswith('require ('):
> +                    inrequire =3D True
> +                    continue
> +                if line.startswith(')'):
> +                    inrequire =3D False
> +                    continue
> +                if line.startswith('require ') or inrequire:
> +                    # we have one line require
> +                    require_line =3D line.lstrip('require
> ').split('//')[0].strip()
> +                    if require_line:
> +                        self.require_lines.append(require_line)
> +                    continue
> +                # we can deal with requires and replaces separately
> because go.mod always writes requires before replaces
> +                if line.startswith('replace ('):
> +                    inreplace =3D True
> +                    continue
> +                if line.startswith(')'):
> +                    inreplace =3D False
> +                    continue
> +                if line.startswith('replace ') or inreplace:
> +                    replace_line =3D line.lstrip('replace
> ').split('//')[0].strip()
> +                    if replace_line:
> +                        self.replace_lines.append(replace_line)
> +                    continue
> +        #
> +        # parse the require_lines and replace_lines to form
> self.modules_require and self.modules_replace
> +        #
> +        logger.debug("Parsing require_lines and replace_lines ...")
> +        # A typical replace line is as below:
> +        #   github.com/hashicorp/golang-lru =3D>
> github.com/ktock/golang-lru v0.5.5-0.20211029085301-ec551be6f75c
> +        # It means that the github.com/hashicorp/golang-lru module is
> replaced by github.com/ktock/golang-lru
> +        # with the version 'v0.5.5-0.20211029085301-ec551be6f75c'.
> +        # So the destdir is vendor/github.com/hashicorp/golang-lru while
> the contents are from github.com/ktock/golang-lru
> +        for line in self.replace_lines:
> +            orig_module, actual =3D line.split('=3D>')
> +            actual_module, actual_version =3D actual.split()
> +            orig_module =3D orig_module.strip()
> +            actual_module =3D actual_module.strip()
> +            actual_version =3D actual_version.strip()
> +            self.modules_replace[orig_module] =3D (actual_module,
> actual_version)
> +        #
> +        # Typical require lines are as below:
> +        #   github.com/Masterminds/semver/v3 v3.1.1
> +        #   golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
> +        #
> +        # We need to first try https://<module_name>?=3Dgo-get=3D1 to se=
e it
> contains
> +        # line starting with '<meta name=3D"go-import" content=3D'.
> +        #
> +        # If so, get root-path vcs repo-url from content. See
> https://go.dev/ref/mod#vcs-find
> +        # For example, the above 'wget
> https://golang.org/x/crypto?go-get=3D1' gives you
> +        # <meta name=3D"go-import" content=3D"golang.org/x/crypto git
> https://go.googlesource.com/crypto">
> +        # In such case, the self.modules_require has the following
> contents:
> +        # module_name: golang.org/x/crypto
> +        # url: https://go.googlesource.com/crypto
> +        # version: v0.0.0-20220321153916-2c7772ba3064
> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/
> golang.org/x/crypto
> +        # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d (git
> rev-list -1 2c7772ba3064)
> +        #
> +        # If not, try https://pkg.go.dev/<module_name>, and find the
> 'Repository'.
> +        # For example, 'wget
> https://pkg.go.dev/github.com/Masterminds/semver/v3' gives:
> +        # github.com/Masterminds/semver
> +        # In such case, the self.modules has the following contents:
> +        # module_name: github.com/Masterminds/semver/v3
> +        # url: https://github.com/Masterminds/semver
> +        # version: v3.1.1
> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/
> github.com/Masterminds/semver/v3
> +        # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e (git
> rev-list -1 v3.1.1)
> +        #
> +        # As a last resort, if the last component of <module_name>
> matches 'v[0-9]+',
> +        # remove the last component and try wget https://
> <module_name_with_last_component_removed>?go-get=3D1,
> +        # then try using the above matching method.
> +        #
> +        for line in self.require_lines:
> +            module_name, version =3D line.strip().split()
> +            logger.debug("require line: %s" % line)
> +            logger.debug("module_name =3D %s; version =3D %s" % (module_=
name,
> version))
> +            # take the modules_replace into consideration to get the
> actual version and actual module name
> +            # note that the module_name is used in destdir, and the
> actual_module_name and actual_version
> +            # are used to determine the url and fullsrcrev
> +            destdir =3D '${WORKDIR}/${BP}/src/import/vendor.fetch/%s' %
> module_name
> +            actual_module_name =3D module_name
> +            actual_version =3D version
> +            if module_name in self.modules_replace:
> +                actual_module_name, actual_version =3D
> self.modules_replace[module_name]
> +            logger.debug("actual_module_name =3D %s; actual_version =3D =
%s" %
> (actual_module_name, actual_version))
> +            url, fullsrcrev =3D self.get_url_srcrev(actual_module_name,
> actual_version)
> +            logger.debug("url =3D %s; fullsrcrev =3D %s" % (url, fullsrc=
rev))
> +            if url and fullsrcrev:
> +                self.modules_require[module_name] =3D (url, version,
> destdir, fullsrcrev)
> +                # form srcpath, actual_module_name/<subpath>
> +                if actual_module_name in self.modules_subpaths:
> +                    subpath =3D self.modules_subpaths[actual_module_name=
]
> +                    srcpath =3D '%s/%s' % (actual_module_name, subpath)
> +                    self.modules_srcpaths[module_name] =3D srcpath
> +                    logger.info("self.modules_srcpaths[%s] =3D %s" %
> (module_name, srcpath))
> +                else:
> +                    self.modules_srcpaths[module_name] =3D
> actual_module_name
> +            else:
> +                logger.warning("get_url_srcrev(%s, %s) failed" %
> (actual_module_name, actual_version))
> +                if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:
> +                    sys.exit(1)
> +
> +    def use_wget_to_get_repo_url(self, wget_content_file, url_cache_file=
,
> module_name):
> +        """
> +        Use wget to get repo_url for module_name, return None if not fou=
nd
> +        """
> +        try:
> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1" %
> (wget_content_file, module_name))
> +            subprocess.check_call('wget -O %s https://%s?=3Dgo-get=3D1' =
%
> (wget_content_file, module_name), shell=3DTrue)
> +            with open(wget_content_file, 'r') as f:
> +                for line in f.readlines():
> +                    if '<meta name=3D"go-import" content=3D' in line:
> +                        logger.info("Succeed to find go-import content
> for %s" % module_name)
> +                        logger.debug("The line is %s" % line)
> +                        root_path, vcs, repo_url =3D
> line.split('content=3D')[1].split('"')[1].split()
> +                        logger.info("%s: %s %s %s" % (module_name,
> root_path, vcs, repo_url))
> +                        if vcs !=3D 'git':
> +                            logger.warning('%s unhandled as its vcs is %=
s
> which is not supported by this script.' % (module_name, vcs))
> +                            unhandled_reason =3D 'vcs %s is not supporte=
d
> by this script' % vcs
> +                            self.modules_unhandled[module_name] =3D
> unhandled_reason
> +                            return None
> +                        with open(url_cache_file, 'w') as f:
> +                            f.write(repo_url)
> +                        return repo_url
> +        except:
> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1 failed" %
> (wget_content_file, module_name))
> +        # if we cannot find repo url from https://<module_name>?=3Dgo-ge=
t=3D1,
> try https://pkg.go/dev/<module_name>
> +        try:
> +            logger.info("wget -O %s https://pkg.go.dev/%s" %
> (wget_content_file, module_name))
> +            subprocess.check_call("wget -O %s https://pkg.go.dev/%s" %
> (wget_content_file, module_name), shell=3DTrue)
> +            repo_url_found =3D False
> +            with open(wget_content_file, 'r') as f:
> +                in_repo_section =3D False
> +                for line in f.readlines():
> +                    if '>Repository<' in line:
> +                        in_repo_section =3D True
> +                        continue
> +                    if in_repo_section:
> +                        newline =3D line.strip()
> +                        if newline !=3D '' and not newline.startswith('<=
'):
> +                            repo_url =3D newline
> +                            repo_url_found =3D True
> +                            break
> +            if repo_url_found:
> +                logger.info("repo url for %s: %s" % (module_name,
> repo_url))
> +                with open(url_cache_file, 'w') as f:
> +                    f.write(repo_url)
> +                return repo_url
> +            else:
> +                unhandled_reason =3D 'cannot determine repo_url for %s' =
%
> module_name
> +                self.modules_unhandled[module_name] =3D unhandled_reason
> +                return None
> +        except:
> +            logger.info("wget -O %s https://pkg.go.dev/%s failed" %
> (wget_content_file, module_name))
> +            return None
> +
> +
> +    def get_repo_url_rev(self, module_name, version):
> +        """
> +        Return (repo_url, rev)
> +        """
> +        import re
> +        # First get rev from version
> +        v =3D version.split('+incompatible')[0]
> +        version_components =3D v.split('-')
> +        if len(version_components) =3D=3D 1:
> +            rev =3D v
> +        elif len(version_components) =3D=3D 3:
> +            if len(version_components[2]) =3D=3D 12:
> +                rev =3D version_components[2]
> +            else:
> +                rev =3D v
> +        else:
> +            rev =3D v
> +
> +        #
> +        # Get repo_url
> +        # We put a cache mechanism here,
> <wget_content_file>.repo_url.cache is used to store the repo url fetch
> before
> +        #
> +        wget_dir =3D os.path.join(self.workdir, 'wget-contents')
> +        if not os.path.exists(wget_dir):
> +            os.makedirs(wget_dir)
> +        wget_content_file =3D os.path.join(wget_dir,
> module_name.replace('/', '_'))
> +        url_cache_file =3D "%s.repo_url.cache" % wget_content_file
> +        if os.path.exists(url_cache_file):
> +            with open(url_cache_file, 'r') as f:
> +                repo_url =3D f.readline().strip()
> +                return (repo_url, rev)
> +        module_name_parts =3D module_name.split('/')
> +        while (len(module_name_parts) > 0):
> +            module_name_to_check =3D '/'.join(module_name_parts)
> +            logger.info("module_name_to_check: %s" %
> module_name_to_check)
> +            repo_url =3D self.use_wget_to_get_repo_url(wget_content_file=
,
> url_cache_file, module_name_to_check)
> +            if repo_url:
> +                return (repo_url, rev)
> +            else:
> +                if module_name in self.modules_unhandled:
> +                    return (None, rev)
> +                else:
> +                    module_name_parts.pop(-1)
> +
> +        unhandled_reason =3D 'cannot determine the repo for %s' %
> module_name
> +        self.modules_unhandled[module_name] =3D unhandled_reason
> +        return (None, rev)
> +
> +    def get_url_srcrev(self, module_name, version):
> +        """
> +        Return url and fullsrcrev according to module_name and version
> +        """
> +        repo_url, rev =3D self.get_repo_url_rev(module_name, version)
> +        if not repo_url or not rev:
> +            return (None, None)
> +        self.fetch_and_checkout_repo(module_name, repo_url, rev)
> +        if module_name in self.modules_repoinfo:
> +            repo_url, repo_dest_dir, repo_fullrev =3D
> self.modules_repoinfo[module_name]
> +            # remove the .git suffix to sync repos across modules with
> different versions and across recipes
> +            if repo_url.endswith('.git'):
> +                repo_url =3D repo_url[:-len('.git')]
> +            return (repo_url, repo_fullrev)
> +        else:
> +            unhandled_reason =3D 'fetch_and_checkout_repo(%s, %s, %s)
> failed' % (module_name, repo_url, rev)
> +            self.modules_unhandled[module_name] =3D unhandled_reason
> +            return (None, None)
> +
> +    def gen_src_uri_inc(self):
> +        """
> +        Generate src_uri.inc file containing SRC_URIs
> +        """
> +        src_uri_inc_file =3D os.path.join(self.workdir, 'src_uri.inc')
> +        # record the <name> after writting SRCREV_<name>, this is to
> avoid modules having the same basename resulting in same SRCREV_xxx
> +        srcrev_name_recorded =3D []
> +        template =3D """#       %s %s
> +# [1] git ls-remote %s %s
> +SRCREV_%s=3D"%s"
> +SRC_URI +=3D
> "git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}=
/${BP}/src/import/vendor.fetch/%s"
> +
> +"""
> +        # We can't simply write SRC_URIs one by one in the order that
> go.mod specify them.
> +        # Because the latter one might clean things up for the former on=
e
> if the former one is a subpath of the latter one.
> +        def take_first_len(elem):
> +            return len(elem[0])
> +
> +        src_uri_contents =3D []
> +        with open(src_uri_inc_file, 'w') as f:
> +            for module in self.modules_require:
> +                # {module_name: (url, version, destdir, fullsrcrev)}
> +                repo_url, version, destdir, fullrev =3D
> self.modules_require[module]
> +                if module in self.modules_replace:
> +                    actual_module_name, actual_version =3D
> self.modules_replace[module]
> +                else:
> +                    actual_module_name, actual_version =3D (module, vers=
ion)
> +                if '://' in repo_url:
> +                    repo_url_noprotocol =3D repo_url.split('://')[1]
> +                else:
> +                    repo_url_noprotocol =3D repo_url
> +                if not repo_url.startswith('https://'):
> +                    repo_url =3D 'https://' + repo_url
> +                name =3D module.split('/')[-1]
> +                if name in srcrev_name_recorded:
> +                    name =3D '-'.join(module.split('/')[-2:])
> +                src_uri_contents.append((actual_module_name,
> actual_version, repo_url, fullrev, name, fullrev, repo_url_noprotocol,
> name, actual_module_name))
> +                srcrev_name_recorded.append(name)
> +            # sort the src_uri_contents and then write it
> +            src_uri_contents.sort(key=3Dtake_first_len)
> +            for content in src_uri_contents:
> +                f.write(template % content)
> +        logger.info("%s generated" % src_uri_inc_file)
> +
> +    def gen_relocation_inc(self):
> +        """
> +        Generate relocation.inc file
> +        """
> +        relocation_inc_file =3D os.path.join(self.workdir, 'relocation.i=
nc')
> +        template =3D """export sites=3D"%s"
> +
> +do_compile:prepend() {
> +    cd ${S}/src/import
> +    for s in $sites; do
> +        site_dest=3D$(echo $s | cut -d: -f1)
> +        site_source=3D$(echo $s | cut -d: -f2)
> +        force_flag=3D$(echo $s | cut -d: -f3)
> +        mkdir -p vendor.copy/$site_dest
> +        if [ -n "$force_flag" ]; then
> +           echo "[INFO] $site_dest: force copying .go files"
> +           rm -rf vendor.copy/$site_dest
> +           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest
> +        else
> +            [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] &=
&
> { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped
> (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go
> files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
> +        fi
> +    done
> +}
> +"""
> +        sites =3D []
> +        for module in self.modules_require:
> +            # <dest>:<source>[:force]
> +            if module in self.modules_srcpaths:
> +                srcpath =3D self.modules_srcpaths[module]
> +                logger.debug("Using %s as srcpath of module (%s)" %
> (srcpath, module))
> +            else:
> +                srcpath =3D module
> +            sites.append("%s:%s:force" % (module, srcpath))
> +        # To avoid the former one being overriden by the latter one when
> the former one is a subpath of the latter one, sort sites
> +        sites.sort(key=3Dlen)
> +        with open(relocation_inc_file, 'w') as f:
> +            sites_str =3D ' \\\n           '.join(sites)
> +            f.write(template % sites_str)
> +        logger.info("%s generated" % relocation_inc_file)
> +
> +    def gen_modules_txt(self):
> +        """
> +        Generate modules.txt file
> +        """
> +        modules_txt_file =3D os.path.join(self.workdir, 'modules.txt')
> +        with open(modules_txt_file, 'w') as f:
> +            for l in self.require_lines:
> +                f.write('# %s\n' % l)
> +                f.write('## explicit\n')
> +            for l in self.replace_lines:
> +                f.write('# %s\n' %l)
> +        logger.info("%s generated" % modules_txt_file)
> +
> +    def sanity_check(self):
> +        """
> +        Various anity checks
> +        """
> +        sanity_check_ok =3D True
> +        #
> +        # Sanity Check 1:
> +        #     For modules having the same repo, at most one is allowed t=
o
> not have subpath.
> +        #     This check operates on self.modules_repoinfo and
> self.modules_subpaths
> +        #
> +        repo_modules =3D {}
> +        for module in self.modules_repoinfo:
> +            # first form {repo: [module1, module2, ...]}
> +            repo_url, repo_dest_dir, fullsrcrev =3D
> self.modules_repoinfo[module]
> +            if repo_url not in repo_modules:
> +                repo_modules[repo_url] =3D [module]
> +            else:
> +                repo_modules[repo_url].append(module)
> +        for repo in repo_modules:
> +            modules =3D repo_modules[repo]
> +            if len(modules) =3D=3D 1:
> +                continue
> +            # for modules sharing the same repo, at most one is allowed
> to not have subpath
> +            nosubpath_modules =3D []
> +            for m in modules:
> +                if m not in self.modules_subpaths:
> +                    nosubpath_modules.append(m)
> +            if len(nosubpath_modules) =3D=3D 0:
> +                continue
> +            if len(nosubpath_modules) > 1:
> +                logger.warning("Multiple modules sharing %s, but they
> don't have subpath: %s. Please double check." % (repo, nosubpath_modules)=
)
> +            if len(nosubpath_modules) =3D=3D 1:
> +                # do further check, OK if the module is the prefix for
> other modules sharing the same repo
> +                module_to_check =3D nosubpath_modules[0]
> +                for m in modules:
> +                    if module_to_check =3D=3D m:
> +                        continue
> +                    if not m.startswith('%s/' % module_to_check):
> +                        logger.warning("%s is sharing repo (%s) with
> other modules, and it might need a subpath. Please double check" %
> (module_to_check, repo))
> +                        continue
> +
> +        #
> +        # End of Sanity Check
> +        #
> +        if not sanity_check_ok:
> +            sys.exit(1)
> +        return
> +
> +def main():
> +    parser =3D argparse.ArgumentParser(
> +        description=3D"oe-go-mod-autogen.py is used to generate
> src_uri.inc, relocation.inc and modules.txt to be used by go mod recipes"=
,
> +        epilog=3D"Use %(prog)s --help to get help")
> +    parser.add_argument("--repo", help =3D "Repo for the recipe.",
> required=3DTrue)
> +    parser.add_argument("--rev", help =3D "Revision for the recipe.",
> required=3DTrue)
> +    parser.add_argument("--module", help =3D "Go module name. To be used
> with '--test'")
> +    parser.add_argument("--version", help =3D "Go module version. To be
> used with '--test'")
> +    parser.add_argument("--test", help =3D "Test to get repo url and
> fullsrcrev, used together with --module and --version.",
> action=3D"store_true")
> +    parser.add_argument("--workdir", help =3D "Working directory to hold
> intermediate results and output.", default=3Dos.getcwd())
> +    parser.add_argument("-d", "--debug",
> +                        help =3D "Enable debug output",
> +                        action=3D"store_const", const=3Dlogging.DEBUG,
> dest=3D"loglevel", default=3Dlogging.INFO)
> +    parser.add_argument("-q", "--quiet",
> +                        help =3D "Hide all output except error messages"=
,
> +                        action=3D"store_const", const=3Dlogging.ERROR,
> dest=3D"loglevel")
> +    args =3D parser.parse_args()
> +
> +    logger.setLevel(args.loglevel)
> +    logger.debug("oe-go-mod-autogen.py running for %s:%s in %s" %
> (args.repo, args.rev, args.workdir))
> +    gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)
> +    if args.test:
> +        if not args.module or not args.version:
> +            print("Please specify --module and --version")
> +            sys.exit(1)
> +        url, srcrev =3D gomodtool.get_url_srcrev(args.module, args.versi=
on)
> +        print("url =3D %s, srcrev =3D %s" % (url, srcrev))
> +        if not url or not srcrev:
> +            print("Failed to get url & srcrev for %s:%s" % (args.module,
> args.version))
> +    else:
> +        gomodtool.parse()
> +        gomodtool.sanity_check()
> +        gomodtool.gen_src_uri_inc()
> +        gomodtool.gen_relocation_inc()
> +        gomodtool.gen_modules_txt()
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        ret =3D main()
> +    except Exception as esc:
> +        ret =3D 1
> +        import traceback
> +        traceback.print_exc()
> +    sys.exit(ret)
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8272):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8272
> Mute This Topic: https://lists.yoctoproject.org/mt/101162746/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004eafb40604994efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Chen Qi via <a href=3D"http://lists.y=
octoproject.org">lists.yoctoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto=
:windriver.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org=
</a>&gt; escreveu no dia ter=C3=A7a, 5/09/2023 =C3=A0(s) 04:22:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
<br>
oe-go-mod-autogen.py is a helper script for go mod recipes. It follows<br>
Bruce&#39;s initiative about how to deal with go mod recipes in OE.<br></bl=
ockquote><div><br></div><div>Place the below description on some README fil=
e or commented=C2=A0itself inside the script can be useful=C2=A0for others.=
<br><br>Jose<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Example:<br>
cmd: &lt;path_to&gt;/meta-virtualization/scripts/oe-go-mod-autogen.py \<br>
=C2=A0 =C2=A0 =C2=A0--repo <a href=3D"https://github.com/docker/compose" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/docker/compose</a> --=
rev v2.20.3<br>
output: src_uri.inc, relocation.inc, modules.txt<br>
<br>
Copy these three generated files to replace the original ones,<br>
then we only need update PV and SRCREV, and docker-compose is upgraded.<br>
<br>
Below are some technical details.<br>
<br>
* get module&#39;s repo from module name<br>
<br>
=C2=A0 This script checks the following two URLs to determine the module&#3=
9;s repo.<br>
=C2=A0 1. https://&lt;module_name_tweaked&gt;?=3Dgo-get=3D1<br>
=C2=A0 2. <a href=3D"https://pkg.go.dev/" rel=3D"noreferrer" target=3D"_bla=
nk">https://pkg.go.dev/</a>&lt;module_name_tweaked&gt;<br>
<br>
=C2=A0 The module_name_tweaked is derived from module_name, with the last c=
omponents<br>
=C2=A0 removed one by one. Let me use two examples to explain this.<br>
<br>
=C2=A0 For module_name <a href=3D"http://sigs.k8s.io/json" rel=3D"noreferre=
r" target=3D"_blank">sigs.k8s.io/json</a>, the <a href=3D"http://sigs.k8s.i=
o/json" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/json</a> is first =
used as<br>
=C2=A0 module_name_tweaked for searching. And we can correctly get the repo=
 URL, so<br>
=C2=A0 the search stops.<br>
<br>
=C2=A0 For module_name <a href=3D"http://github.com/k3s-io/etcd/api/v3" rel=
=3D"noreferrer" target=3D"_blank">github.com/k3s-io/etcd/api/v3</a>, the fo=
llowing ones are used<br>
=C2=A0 as module_name_tweaked:<br>
=C2=A0 <a href=3D"http://github.com/k3s-io/etcd/api/v3" rel=3D"noreferrer" =
target=3D"_blank">github.com/k3s-io/etcd/api/v3</a><br>
=C2=A0 <a href=3D"http://github.com/k3s-io/etcd/api" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/k3s-io/etcd/api</a><br>
=C2=A0 <a href=3D"http://github.com/k3s-io/etcd" rel=3D"noreferrer" target=
=3D"_blank">github.com/k3s-io/etcd</a><br>
=C2=A0 And when searching &#39;<a href=3D"http://github.com/k3s-io/etcd" re=
l=3D"noreferrer" target=3D"_blank">github.com/k3s-io/etcd</a>&#39;, we get =
the repo URL, so the search<br>
=C2=A0 stops.<br>
<br>
* determine the srcdir:destdir mapping in &#39;vendor&#39; creation<br>
<br>
=C2=A0 To correctly form the &#39;vendor&#39; directory, the mapping is cri=
tical.<br>
=C2=A0 This script makes use of tag matching and path matching to determine=
<br>
=C2=A0 the subpath in the repo for the module.<br>
<br>
* avoid subpath being overriden by parent path<br>
<br>
=C2=A0 We need to avoid subpath being overriden by parent path. This is nee=
ded<br>
=C2=A0 for both SRC_URI ordering in src_uri.inc and the sites mapping order=
ing<br>
=C2=A0 in relocation.inc. This script simply uses the length as the orderin=
g key,<br>
=C2=A0 simply for the reason that if a path is a subpath of another path, i=
t must<br>
=C2=A0 be longer.<br>
<br>
* the .git suffix is removed to sync with each other<br>
<br>
=C2=A0 Unlike normal recipes, go mod recipe usually have many SRC_URIs. Thi=
s script<br>
=C2=A0 remove the &#39;.git&#39; suffix from repo URL so that the repo URLs=
 are in sync<br>
=C2=A0 with each.<br>
<br>
* basic directory hierarchy and caching mechanism<br>
<br>
=C2=A0 &lt;cwd&gt;/repos: hold the repos downloaded and checked<br>
=C2=A0 &lt;cwd&gt;/wget-contents: hold the contents to determine the module=
&#39;s repo<br>
=C2=A0 &lt;cwd&gt;/wget-contents/&lt;module_name&gt;.repo_url.cache: the re=
po value cache<br>
=C2=A0 This is to avoid unnecessary URL fetching and repo cloning.<br>
<br>
* the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script<br>
<br>
=C2=A0 The script must get the correct repo_url, fullsrc_rev and subpath fo=
r<br>
=C2=A0 each required module in go.mod to correctly generate the src_uri.inc=
 and<br>
=C2=A0 relocation.inc files. If this process fails for any required module,=
 this<br>
=C2=A0 script stop immediately, as I deliberately set ERROR_OUT_ON_FETCH_AN=
D_CHECKOUT_FAILURE<br>
=C2=A0 to True in this script. The purpose is to encourage people to report=
<br>
=C2=A0 problems to meta-virt so that we can improve this script according t=
o<br>
=C2=A0 these feedbacks. But this variable can set to False, then the script=
<br>
=C2=A0 only records the failed modules in self.modules_unhandled with reaso=
ns<br>
=C2=A0 added, people can modify the generated src_uri.inc and relocation.in=
c<br>
=C2=A0 to manually handle these unhandled modules if they are urgent to<br>
=C2=A0 add/upgrade some go mod recipes.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-go-mod-autogen.py | 663 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 663 insertions(+)<br>
=C2=A0create mode 100755 scripts/oe-go-mod-autogen.py<br>
<br>
diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-autogen.py<br=
>
new file mode 100755<br>
index 00000000..09d6133b<br>
--- /dev/null<br>
+++ b/scripts/oe-go-mod-autogen.py<br>
@@ -0,0 +1,663 @@<br>
+#!/usr/bin/env python3<br>
+<br>
+import os<br>
+import sys<br>
+import logging<br>
+import argparse<br>
+from collections import OrderedDict<br>
+import subprocess<br>
+<br>
+# This switch is used to make this script error out ASAP, mainly for debug=
ging purpose<br>
+ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True<br>
+<br>
+logger =3D logging.getLogger(&#39;oe-go-mod-autogen&#39;)<br>
+loggerhandler =3D logging.StreamHandler()<br>
+loggerhandler.setFormatter(logging.Formatter(&quot;%(levelname)s: %(messag=
e)s&quot;))<br>
+logger.addHandler(loggerhandler)<br>
+logger.setLevel(logging.INFO)<br>
+<br>
+class GoModTool(object):<br>
+=C2=A0 =C2=A0 def __init__(self, repo, rev, workdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.repo =3D repo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rev =3D rev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.workdir =3D workdir<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Stores the actual module name and its relate=
d information<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {module: (repo_url, repo_dest_dir, fullsrcre=
v)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_repoinfo =3D {}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {module_name: (url, version, destdir, fullsr=
crev)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url: place to get the source codes, we only =
support git repo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version: module version, git tag or git rev<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir: place to put the fetched source cod=
es<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev: full src rev which is the value =
of SRC_REV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For &#39;<a href=3D"http://github.com/Master=
minds/semver/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Mastermind=
s/semver/v3</a> v3.1.1&#39; in go.mod:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # module_name =3D <a href=3D"http://github.com=
/Masterminds/semver/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Mas=
terminds/semver/v3</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url =3D <a href=3D"https://github.com/Master=
minds/semver" rel=3D"noreferrer" target=3D"_blank">https://github.com/Maste=
rminds/semver</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version =3D v3.1.1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT=
}/vendor/<a href=3D"http://github.com/Masterminds/semver/v3" rel=3D"norefer=
rer" target=3D"_blank">github.com/Masterminds/semver/v3</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev =3D d387ce7889a157b19ad7694dba39a=
562051f41b0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_require =3D OrderedDict()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {orig_module: (actual_module, actual_version=
)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_replace =3D OrderedDict()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Unhandled modules<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandled =3D OrderedDict()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # store subpaths used to form srcpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {actual_module_name: subpath}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_subpaths =3D OrderedDict()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # modules&#39;s actual source paths, record th=
ose that are not the same with the module itself<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_srcpaths =3D OrderedDict()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # store lines, comment removed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.require_lines =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.replace_lines =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fetch repo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fetch_and_checkout_repo(self.repo.split(&=
#39;://&#39;)[1], self.repo, self.rev, checkout=3DTrue, get_subpath=3DFalse=
)<br>
+<br>
+=C2=A0 =C2=A0 def show_go_mod_info(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Print modules_require, modules_replace and m=
odules_unhandled<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;modules required:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in self.modules_require:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url, version, destdir, fullrev =
=3D self.modules_require[m]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;%s %s %s %s&quot; % =
(m, version, url, fullrev))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;modules replace:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in self.modules_replace:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_module, actual_version =
=3D self.modules_replace[m]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;%s =3D&gt; %s %s&quo=
t; % (m, actual_module, actual_version))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;modules unhandled:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in self.modules_unhandled:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reason =3D self.modules_unhandle=
d[m]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;%s unhandled: %s&quo=
t; % (m, reason))<br>
+<br>
+=C2=A0 =C2=A0 def parse(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if this repo needs autogen<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, repo_dest_dir, repo_fullrev =3D self=
.modules_repoinfo[self.repo.split(&#39;://&#39;)[1]]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(os.path.join(repo_dest_dir, &=
#39;vendor&#39;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;vendor direcotry =
has already existed for %s, no need to add other repos&quot; % self.repo)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 go_mod_file =3D os.path.join(repo_dest_dir, &#=
39;go.mod&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(go_mod_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;go.mod file does =
not exist for %s, no need to add otehr repos&quot; % self.repo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parse_go_mod(go_mod_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_go_mod_info()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 def fetch_and_checkout_repo(self, module_name, repo_url, rev=
, default_protocol=3D&#39;https://&#39;, checkout=3DFalse, get_subpath=3DTr=
ue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fetch repo_url to &lt;workdir&gt;/repos/repo_b=
ase_name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 protocol =3D default_protocol<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;://&#39; in repo_url:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url_final =3D repo_url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url_final =3D default_proto=
col + repo_url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;fetch and checkout %s %s&qu=
ot; % (repo_url_final, rev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 repos_dir =3D os.path.join(self.workdir, &#39;=
repos&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(repos_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(repos_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_basename =3D repo_url.split(&#39;/&#39;)[=
-1].split(&#39;.git&#39;)[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_dest_dir =3D os.path.join(repos_dir, repo=
_basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_last_name =3D module_name.split(&#39;/&=
#39;)[-1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot;fetch&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(repo_dest_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if checkout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if current=
 HEAD is rev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 head=
rev =3D subprocess.check_output(&#39;git rev-list -1 HEAD&#39;, shell=3DTru=
e, cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
iredrev =3D subprocess.check_output(&#39;git rev-list -1 %s 2&gt;/dev/null =
|| git rev-list -1 %s/%s&#39; % (rev, module_last_name, rev), shell=3DTrue,=
 cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if h=
eadrev =3D=3D requiredrev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_bla=
nk">logger.info</a>(&quot;%s has already been fetched and checked out as re=
quired, skipping&quot; % repo_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.modules_repoinfo[module_name] =3D (repo_url, repo_dest_dir,=
 requiredrev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_bla=
nk">logger.info</a>(&quot;HEAD of %s is not %s, will do a clean clone&quot;=
 % (repo_dest_dir, requiredrev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git_action =3D &quot;clone&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info=
</a>(&quot;&#39;git rev-list&#39; in %s failed, will do a clean clone&quot;=
 % repo_dest_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_=
action =3D &quot;clone&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # determine if the=
 current repo points to the desired remote repo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remo=
te_origin_url =3D subprocess.check_output(&#39;git config --get remote.orig=
in.url&#39;, shell=3DTrue, cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).str=
ip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r=
emote_origin_url.endswith(&#39;.git&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if not repo_url_final.endswith(&#39;.git&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 remote_origin_url =3D remote_origin_url[:-4]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if repo_url_final.endswith(&#39;.git&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 remote_origin_url =3D remote_origin_url + &#39;.gi=
t&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r=
emote_origin_url !=3D repo_url_final:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_bla=
nk">logger.info</a>(&quot;remote.origin.url for %s is not %s, will do a cle=
an clone&quot; % (repo_dest_dir, repo_url_final))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git_action =3D &quot;clone&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info=
</a>(&quot;&#39;git config --get remote.origin.url&#39; in %s failed, will =
do a clean clone&quot; % repo_dest_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_=
action =3D &quot;clone&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # No local repo, clone it.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot;clone&quot;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if git_action =3D=3D &quot;clone&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Removing %s&quot;=
 % repo_dest_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(&#39;rm -r=
f %s&#39; % repo_dest_dir, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # clone/fetch repo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_cwd =3D repos_dir if git_act=
ion =3D=3D &quot;clone&quot; else repo_dest_dir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;git %s %s in %s&q=
uot; % (git_action, repo_url_final, git_cwd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(&#39;git %=
s %s &gt;/dev/null 2&gt;&amp;1&#39; % (git_action, repo_url_final), shell=
=3DTrue, cwd=3Dgit_cwd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&quot;Failed to %=
s %s in %s&quot; % (git_action, repo_url_final, git_cwd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def get_requiredrev(get_subpath):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if rev is a revision or =
a version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(rev) =3D=3D 12 and re.mat=
ch(&#39;[0-9a-f]+&#39;, rev):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev_is_version =3D=
 False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev_is_version =3D=
 True<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # if rev is not a version, &#39;=
git rev-list -1 &lt;rev&gt;&#39; should just succeed!<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not rev_is_version:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev_=
return =3D subprocess.check_output(&#39;git rev-list -1 %s 2&gt;/dev/null&#=
39; % rev, shell=3DTrue, cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).strip=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if g=
et_subpath:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd =3D &#39;git branch -M toremove &amp;&amp; git checkout -b c=
heck_subpath %s &amp;&amp; git branch -D toremove&#39; % rev_return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 subprocess.check_call(cmd, shell=3DTrue, cwd=3Drepo_dest_dir)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # try to get the subpath for this module<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 module_name_parts =3D module_name.split(&#39;/&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 while (len(module_name_parts) &gt; 0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D &#39;/&#39;.join(module_name_parts)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 dir_to_check =3D repo_dest_dir + &#39;/&#39; + &#3=
9;/&#39;.join(module_name_parts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(dir_to_check):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_subpaths[module_name] =
=3D subpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name_parts.pop(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn rev_return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logg=
er.warning(&quot;Revision (%s) not in repo(%s)&quot; % (rev, repo_dest_dir)=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the following codes deals with=
 case where rev is a version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # determine the longest match ta=
g, in this way, we can get the current srcpath to be used in relocation.inc=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # we first get the initial tag, =
which is formed from module_name and rev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_parts =3D module_name.spl=
it(&#39;/&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev.startswith(module_parts[-=
1] + &#39;.&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag =3D &#39;/&#39=
;.join(module_parts[:-1]) + &#39;/&#39; + rev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_module_part_r=
eplaced =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag =3D &#39;/&#39=
;.join(module_parts) + &#39;/&#39; + rev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_module_part_r=
eplaced =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;use %s as the=
 initial tag for %s&quot; % (tag, module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_parts =3D tag.split(&#39;/&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while(len(tag_parts) &gt; 0):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev_=
return =3D subprocess.check_output(&#39;git rev-list -1 %s 2&gt;/dev/null&#=
39; % tag, shell=3DTrue, cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).strip=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l=
en(tag_parts) &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # ensure that the subpath exists<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if get_subpath:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;git branch -M toremove &amp;&amp; git=
 checkout -b check_subpath %s &amp;&amp; git branch -D toremove&#39; % rev_=
return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(cmd, shell=3DTrue, cwd=3Drep=
o_dest_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # get subpath for the actual_module_name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if last_module_part_replaced:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D &#39;/&#39;.join(tag_par=
ts[:-1]) + &#39;/&#39; + module_parts[-1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(repo_dest_dir +=
 &#39;/&#39; + subpath):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D &#39;/&#39=
;.join(tag_parts[:-1])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D &#39;/&#39;.join(tag_par=
ts[:-1])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(repo_dest_dir + &#39;/&#39; +=
 subpath):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&quot;subpath (%s) de=
rived from tag matching does not exist in %s&quot; % (subpath, repo_dest_di=
r))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_subpaths[module_name] =3D subpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" =
target=3D"_blank">logger.info</a>(&quot;modules_subpath[%s] =3D %s&quot; % =
(module_name, subpath))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn rev_return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_=
parts.pop(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag =
=3D &#39;/&#39;.join(tag_parts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&quot;No tag matc=
hing %s&quot; % rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 requiredrev =3D get_requiredrev(get_subpath)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if requiredrev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Got module(%s) re=
quiredrev: %s&quot; % (module_name, requiredrev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if checkout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_c=
all(&#39;git checkout -b gomodautogen %s&#39; % requiredrev, shell=3DTrue, =
cwd=3Drepo_dest_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_repoinfo[module_nam=
e] =3D (repo_url, repo_dest_dir, requiredrev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&quot;Failed to g=
et requiredrev, repo_url =3D %s, rev =3D %s, module_name =3D %s&quot; % (re=
po_url, rev, module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 def parse_go_mod(self, go_mod_path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parse go.mod file to get the modules info<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First we get the require and replace lines<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The parsing logic assumes the replace lines =
come *after* the require lines<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 inrequire =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 inreplace =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(go_mod_path, &#39;r&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines =3D f.readlines()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;require (&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inre=
quire =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;)&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inre=
quire =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;require &#39;) or inrequire:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # we=
 have one line require<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
ire_line =3D line.lstrip(&#39;require &#39;).split(&#39;//&#39;)[0].strip()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r=
equire_line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.require_lines.append(require_line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # we can deal with=
 requires and replaces separately because go.mod always writes requires bef=
ore replaces<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;replace (&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inre=
place =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;)&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inre=
place =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;replace &#39;) or inreplace:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repl=
ace_line =3D line.lstrip(&#39;replace &#39;).split(&#39;//&#39;)[0].strip()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r=
eplace_line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.replace_lines.append(replace_line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # parse the require_lines and replace_lines to=
 form self.modules_require and self.modules_replace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Parsing require_lines and r=
eplace_lines ...&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # A typical replace line is as below:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0<a href=3D"http://github.com/has=
hicorp/golang-lru" rel=3D"noreferrer" target=3D"_blank">github.com/hashicor=
p/golang-lru</a> =3D&gt; <a href=3D"http://github.com/ktock/golang-lru" rel=
=3D"noreferrer" target=3D"_blank">github.com/ktock/golang-lru</a> v0.5.5-0.=
20211029085301-ec551be6f75c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It means that the <a href=3D"http://github.c=
om/hashicorp/golang-lru" rel=3D"noreferrer" target=3D"_blank">github.com/ha=
shicorp/golang-lru</a> module is replaced by <a href=3D"http://github.com/k=
tock/golang-lru" rel=3D"noreferrer" target=3D"_blank">github.com/ktock/gola=
ng-lru</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # with the version &#39;v0.5.5-0.2021102908530=
1-ec551be6f75c&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # So the destdir is vendor/<a href=3D"http://g=
ithub.com/hashicorp/golang-lru" rel=3D"noreferrer" target=3D"_blank">github=
.com/hashicorp/golang-lru</a> while the contents are from <a href=3D"http:/=
/github.com/ktock/golang-lru" rel=3D"noreferrer" target=3D"_blank">github.c=
om/ktock/golang-lru</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in self.replace_lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_module, actual =3D line.spl=
it(&#39;=3D&gt;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_module, actual_version =
=3D actual.split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_module =3D orig_module.stri=
p()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_module =3D actual_module.=
strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_version =3D actual_versio=
n.strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_replace[orig_module=
] =3D (actual_module, actual_version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Typical require lines are as below:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0<a href=3D"http://github.com/Mas=
terminds/semver/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Masterm=
inds/semver/v3</a> v3.1.1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0<a href=3D"http://golang.org/x/c=
rypto" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.0.0-=
20220321153916-2c7772ba3064<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to first try https://&lt;module_name=
&gt;?=3Dgo-get=3D1 to see it contains<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # line starting with &#39;&lt;meta name=3D&quo=
t;go-import&quot; content=3D&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If so, get root-path vcs repo-url from conte=
nt. See <a href=3D"https://go.dev/ref/mod#vcs-find" rel=3D"noreferrer" targ=
et=3D"_blank">https://go.dev/ref/mod#vcs-find</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For example, the above &#39;wget <a href=3D"=
https://golang.org/x/crypto?go-get=3D1" rel=3D"noreferrer" target=3D"_blank=
">https://golang.org/x/crypto?go-get=3D1</a>&#39; gives you<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &lt;meta name=3D&quot;go-import&quot; conten=
t=3D&quot;<a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/crypto</a> git <a href=3D"https://go.googlesource.=
com/crypto" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.co=
m/crypto</a>&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In such case, the self.modules_require has t=
he following contents:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # module_name: <a href=3D"http://golang.org/x/=
crypto" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url: <a href=3D"https://go.googlesource.com/=
crypto" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/cr=
ypto</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version: v0.0.0-20220321153916-2c7772ba3064<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir: ${WORKDIR}/${BP}/src/import/vendor.=
fetch/<a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=3D"_=
blank">golang.org/x/crypto</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev: 2c7772ba30643b7a2026cbea938420dc=
e7c6384d (git rev-list -1 2c7772ba3064)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If not, try <a href=3D"https://pkg.go.dev/" =
rel=3D"noreferrer" target=3D"_blank">https://pkg.go.dev/</a>&lt;module_name=
&gt;, and find the &#39;Repository&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For example, &#39;wget <a href=3D"https://pk=
g.go.dev/github.com/Masterminds/semver/v3" rel=3D"noreferrer" target=3D"_bl=
ank">https://pkg.go.dev/github.com/Masterminds/semver/v3</a>&#39; gives:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://github.com/Masterminds/sem=
ver" rel=3D"noreferrer" target=3D"_blank">github.com/Masterminds/semver</a>=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In such case, the self.modules has the follo=
wing contents:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # module_name: <a href=3D"http://github.com/Ma=
sterminds/semver/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Master=
minds/semver/v3</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url: <a href=3D"https://github.com/Mastermin=
ds/semver" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mastermi=
nds/semver</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version: v3.1.1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir: ${WORKDIR}/${BP}/src/import/vendor.=
fetch/<a href=3D"http://github.com/Masterminds/semver/v3" rel=3D"noreferrer=
" target=3D"_blank">github.com/Masterminds/semver/v3</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b44=
2bb3ef3e (git rev-list -1 v3.1.1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # As a last resort, if the last component of &=
lt;module_name&gt; matches &#39;v[0-9]+&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove the last component and try wget https=
://&lt;module_name_with_last_component_removed&gt;?go-get=3D1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # then try using the above matching method.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in self.require_lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name, version =3D line.st=
rip().split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;require line:=
 %s&quot; % line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;module_name =
=3D %s; version =3D %s&quot; % (module_name, version))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # take the modules_replace into =
consideration to get the actual version and actual module name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # note that the module_name is u=
sed in destdir, and the actual_module_name and actual_version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # are used to determine the url =
and fullsrcrev<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir =3D &#39;${WORKDIR}/${BP=
}/src/import/vendor.fetch/%s&#39; % module_name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_module_name =3D module_na=
me<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_version =3D version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if module_name in self.modules_r=
eplace:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_module_name=
, actual_version =3D self.modules_replace[module_name]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;actual_module=
_name =3D %s; actual_version =3D %s&quot; % (actual_module_name, actual_ver=
sion))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url, fullsrcrev =3D self.get_url=
_srcrev(actual_module_name, actual_version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;url =3D %s; f=
ullsrcrev =3D %s&quot; % (url, fullsrcrev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url and fullsrcrev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_requi=
re[module_name] =3D (url, version, destdir, fullsrcrev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # form srcpath, ac=
tual_module_name/&lt;subpath&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if actual_module_n=
ame in self.modules_subpaths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subp=
ath =3D self.modules_subpaths[actual_module_name]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcp=
ath =3D &#39;%s/%s&#39; % (actual_module_name, subpath)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.modules_srcpaths[module_name] =3D srcpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info=
</a>(&quot;self.modules_srcpaths[%s] =3D %s&quot; % (module_name, srcpath))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.modules_srcpaths[module_name] =3D actual_module_name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&qu=
ot;get_url_srcrev(%s, %s) failed&quot; % (actual_module_name, actual_versio=
n))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ERROR_OUT_ON_FE=
TCH_AND_CHECKOUT_FAILURE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.=
exit(1)<br>
+<br>
+=C2=A0 =C2=A0 def use_wget_to_get_repo_url(self, wget_content_file, url_ca=
che_file, module_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use wget to get repo_url for module_name, retu=
rn None if not found<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;wget -O %s https:=
//%s?=3Dgo-get=3D1&quot; % (wget_content_file, module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(&#39;wget =
-O %s https://%s?=3Dgo-get=3D1&#39; % (wget_content_file, module_name), she=
ll=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(wget_content_file, &#3=
9;r&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.read=
lines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &=
#39;&lt;meta name=3D&quot;go-import&quot; content=3D&#39; in line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_bla=
nk">logger.info</a>(&quot;Succeed to find go-import content for %s&quot; % =
module_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 logger.debug(&quot;The line is %s&quot; % line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 root_path, vcs, repo_url =3D line.split(&#39;content=3D&#39;)[1]=
.split(&#39;&quot;&#39;)[1].split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_bla=
nk">logger.info</a>(&quot;%s: %s %s %s&quot; % (module_name, root_path, vcs=
, repo_url))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if vcs !=3D &#39;git&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&#39;%s unhandled as its vcs is %s =
which is not supported by this script.&#39; % (module_name, vcs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_reason =3D &#39;vcs %s is not supported =
by this script&#39; % vcs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandled[module_name] =3D unhandled_=
reason<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 with open(url_cache_file, &#39;w&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 f.write(repo_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return repo_url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;wget -O %s https:=
//%s?=3Dgo-get=3D1 failed&quot; % (wget_content_file, module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if we cannot find repo url from https://&lt;=
module_name&gt;?=3Dgo-get=3D1, try <a href=3D"https://pkg.go/dev/" rel=3D"n=
oreferrer" target=3D"_blank">https://pkg.go/dev/</a>&lt;module_name&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;wget -O %s <a hre=
f=3D"https://pkg.go.dev/%s" rel=3D"noreferrer" target=3D"_blank">https://pk=
g.go.dev/%s</a>&quot; % (wget_content_file, module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(&quot;wget=
 -O %s <a href=3D"https://pkg.go.dev/%s" rel=3D"noreferrer" target=3D"_blan=
k">https://pkg.go.dev/%s</a>&quot; % (wget_content_file, module_name), shel=
l=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url_found =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(wget_content_file, &#3=
9;r&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_repo_section =
=3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.read=
lines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &=
#39;&gt;Repository&lt;&#39; in line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 in_repo_section =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i=
n_repo_section:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 newline =3D line.strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if newline !=3D &#39;&#39; and not newline.startswith(&#39;&lt;&=
#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 repo_url =3D newline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 repo_url_found =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if repo_url_found:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;rep=
o url for %s: %s&quot; % (module_name, repo_url))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(url_cach=
e_file, &#39;w&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.wr=
ite(repo_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return repo_url<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_reason =
=3D &#39;cannot determine repo_url for %s&#39; % module_name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhan=
dled[module_name] =3D unhandled_reason<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;wget -O %s <a hre=
f=3D"https://pkg.go.dev/%s" rel=3D"noreferrer" target=3D"_blank">https://pk=
g.go.dev/%s</a> failed&quot; % (wget_content_file, module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 def get_repo_url_rev(self, module_name, version):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (repo_url, rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First get rev from version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D version.split(&#39;+incompatible&#39;)[0=
]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 version_components =3D v.split(&#39;-&#39;)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(version_components) =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D v<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif len(version_components) =3D=3D 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(version_components[2]) =
=3D=3D 12:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D version_co=
mponents[2]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D v<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D v<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get repo_url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We put a cache mechanism here, &lt;wget_cont=
ent_file&gt;.repo_url.cache is used to store the repo url fetch before<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget_dir =3D os.path.join(self.workdir, &#39;w=
get-contents&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(wget_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(wget_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget_content_file =3D os.path.join(wget_dir, m=
odule_name.replace(&#39;/&#39;, &#39;_&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_cache_file =3D &quot;%s.repo_url.cache&quo=
t; % wget_content_file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(url_cache_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(url_cache_file, &#39;r=
&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url =3D f.rea=
dline().strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (repo_url, =
rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name_parts =3D module_name.split(&#39;/=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len(module_name_parts) &gt; 0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name_to_check =3D &#39;/&=
#39;.join(module_name_parts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;module_name_to_ch=
eck: %s&quot; % module_name_to_check)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url =3D self.use_wget_to_ge=
t_repo_url(wget_content_file, url_cache_file, module_name_to_check)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if repo_url:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (repo_url, =
rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if module_name in =
self.modules_unhandled:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn (None, rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modu=
le_name_parts.pop(-1)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_reason =3D &#39;cannot determine the=
 repo for %s&#39; % module_name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandled[module_name] =3D unhand=
led_reason<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (None, rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 def get_url_srcrev(self, module_name, version):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return url and fullsrcrev according to module_=
name and version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, rev =3D self.get_repo_url_rev(module=
_name, version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not repo_url or not rev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (None, None)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fetch_and_checkout_repo(module_name, repo=
_url, rev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if module_name in self.modules_repoinfo:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, repo_dest_dir, repo_fu=
llrev =3D self.modules_repoinfo[module_name]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove the .git suffix to sync=
 repos across modules with different versions and across recipes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if repo_url.endswith(&#39;.git&#=
39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url =3D repo_=
url[:-len(&#39;.git&#39;)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (repo_url, repo_fullrev)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_reason =3D &#39;fetch_=
and_checkout_repo(%s, %s, %s) failed&#39; % (module_name, repo_url, rev)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandled[module_na=
me] =3D unhandled_reason<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (None, None)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 def gen_src_uri_inc(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate src_uri.inc file containing SRC_URIs =
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri_inc_file =3D os.path.join(self.workdir=
, &#39;src_uri.inc&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # record the &lt;name&gt; after writting SRCRE=
V_&lt;name&gt;, this is to avoid modules having the same basename resulting=
 in same SRCREV_xxx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcrev_name_recorded =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 template =3D &quot;&quot;&quot;#=C2=A0 =C2=A0 =
=C2=A0 =C2=A0%s %s<br>
+# [1] git ls-remote %s %s<br>
+SRCREV_%s=3D&quot;%s&quot;<br>
+SRC_URI +=3D &quot;git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/%s&quot;<br>
+<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can&#39;t simply write SRC_URIs one by on=
e in the order that go.mod specify them.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Because the latter one might clean things up=
 for the former one if the former one is a subpath of the latter one.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def take_first_len(elem):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return len(elem[0])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri_contents =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(src_uri_inc_file, &#39;w&#39;) as f:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in self.modules_requi=
re:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # {module_name: (u=
rl, version, destdir, fullsrcrev)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, version,=
 destdir, fullrev =3D self.modules_require[module]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if module in self.=
modules_replace:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actu=
al_module_name, actual_version =3D self.modules_replace[module]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actu=
al_module_name, actual_version =3D (module, version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;://&#39; i=
n repo_url:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo=
_url_noprotocol =3D repo_url.split(&#39;://&#39;)[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo=
_url_noprotocol =3D repo_url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not repo_url.st=
artswith(&#39;https://&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo=
_url =3D &#39;https://&#39; + repo_url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D module.sp=
lit(&#39;/&#39;)[-1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name in srcrev_=
name_recorded:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=
 =3D &#39;-&#39;.join(module.split(&#39;/&#39;)[-2:])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri_contents.a=
ppend((actual_module_name, actual_version, repo_url, fullrev, name, fullrev=
, repo_url_noprotocol, name, actual_module_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcrev_name_record=
ed.append(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # sort the src_uri_contents and =
then write it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri_contents.sort(key=3Dtake=
_first_len)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for content in src_uri_contents:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template %=
 content)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&quot;%s generated&quot; % src_uri_in=
c_file)<br>
+<br>
+=C2=A0 =C2=A0 def gen_relocation_inc(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate relocation.inc file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 relocation_inc_file =3D os.path.join(self.work=
dir, &#39;relocation.inc&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 template =3D &quot;&quot;&quot;export sites=3D=
&quot;%s&quot;<br>
+<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 cd ${S}/src/import<br>
+=C2=A0 =C2=A0 for s in $sites; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 site_dest=3D$(echo $s | cut -d: -f1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 site_source=3D$(echo $s | cut -d: -f2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 force_flag=3D$(echo $s | cut -d: -f3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p vendor.copy/$site_dest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$force_flag&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;[INFO] $site_dest: for=
ce copying .go files&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf vendor.copy/$site_dest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsync -a --exclude=3D&#39;vendor/=
&#39; --exclude=3D&#39;.git/&#39; vendor.fetch/$site_source/ vendor.copy/$s=
ite_dest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -n &quot;$(ls -A vendor.copy/$=
site_dest/*.go 2&gt; /dev/null)&quot; ] &amp;&amp; { echo &quot;[INFO] vend=
or.fetch/$site_source -&gt; $site_dest: go copy skipped (files present)&quo=
t; ; true ; } || { echo &quot;[INFO] $site_dest: copying .go files&quot; ; =
rsync -a --exclude=3D&#39;vendor/&#39; --exclude=3D&#39;.git/&#39; vendor.f=
etch/$site_source/ vendor.copy/$site_dest ; }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sites =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in self.modules_require:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # &lt;dest&gt;:&lt;source&gt;[:f=
orce]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if module in self.modules_srcpat=
hs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcpath =3D self.m=
odules_srcpaths[module]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot=
;Using %s as srcpath of module (%s)&quot; % (srcpath, module))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcpath =3D module=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sites.append(&quot;%s:%s:force&q=
uot; % (module, srcpath))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # To avoid the former one being overriden by t=
he latter one when the former one is a subpath of the latter one, sort site=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sites.sort(key=3Dlen)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(relocation_inc_file, &#39;w&#39;) as=
 f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sites_str =3D &#39; \\\n=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.join(sites)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template % sites_str)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&quot;%s generated&quot; % relocation=
_inc_file)<br>
+<br>
+=C2=A0 =C2=A0 def gen_modules_txt(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate modules.txt file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 modules_txt_file =3D os.path.join(self.workdir=
, &#39;modules.txt&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(modules_txt_file, &#39;w&#39;) as f:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in self.require_lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;# %s\=
n&#39; % l)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;## ex=
plicit\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in self.replace_lines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;# %s\=
n&#39; %l)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&quot;%s generated&quot; % modules_tx=
t_file)<br>
+<br>
+=C2=A0 =C2=A0 def sanity_check(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Various anity checks<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sanity_check_ok =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sanity Check 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0For modules having the sa=
me repo, at most one is allowed to not have subpath.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0This check operates on se=
lf.modules_repoinfo and self.modules_subpaths<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_modules =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in self.modules_repoinfo:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # first form {repo: [module1, mo=
dule2, ...]}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, repo_dest_dir, fullsrc=
rev =3D self.modules_repoinfo[module]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if repo_url not in repo_modules:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_modules[repo_=
url] =3D [module]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_modules[repo_=
url].append(module)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for repo in repo_modules:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modules =3D repo_modules[repo]<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(modules) =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for modules sharing the same r=
epo, at most one is allowed to not have subpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nosubpath_modules =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in modules:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m not in self.m=
odules_subpaths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nosu=
bpath_modules.append(m)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(nosubpath_modules) =3D=3D=
 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(nosubpath_modules) &gt; 1=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&qu=
ot;Multiple modules sharing %s, but they don&#39;t have subpath: %s. Please=
 double check.&quot; % (repo, nosubpath_modules))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(nosubpath_modules) =3D=3D=
 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # do further check=
, OK if the module is the prefix for other modules sharing the same repo<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_to_check =
=3D nosubpath_modules[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in modules:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
odule_to_check =3D=3D m:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n=
ot m.startswith(&#39;%s/&#39; % module_to_check):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 logger.warning(&quot;%s is sharing repo (%s) with other modules,=
 and it might need a subpath. Please double check&quot; % (module_to_check,=
 repo))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # End of Sanity Check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not sanity_check_ok:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3D&quot;oe-go-mod-autogen.py is us=
ed to generate src_uri.inc, relocation.inc and modules.txt to be used by go=
 mod recipes&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 epilog=3D&quot;Use %(prog)s --help to get help=
&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--repo&quot;, help =3D &quot;Repo =
for the recipe.&quot;, required=3DTrue)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--rev&quot;, help =3D &quot;Revisi=
on for the recipe.&quot;, required=3DTrue)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--module&quot;, help =3D &quot;Go =
module name. To be used with &#39;--test&#39;&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--version&quot;, help =3D &quot;Go=
 module version. To be used with &#39;--test&#39;&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--test&quot;, help =3D &quot;Test =
to get repo url and fullsrcrev, used together with --module and --version.&=
quot;, action=3D&quot;store_true&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--workdir&quot;, help =3D &quot;Wo=
rking directory to hold intermediate results and output.&quot;, default=3Do=
s.getcwd())<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;-d&quot;, &quot;--debug&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help =3D &quot;Enable debug output&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 action=3D&quot;store_const&quot;, const=3Dlogging.DEBUG, dest=3D=
&quot;loglevel&quot;, default=3Dlogging.INFO)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;-q&quot;, &quot;--quiet&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help =3D &quot;Hide all output except error messages&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 action=3D&quot;store_const&quot;, const=3Dlogging.ERROR, dest=3D=
&quot;loglevel&quot;)<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 logger.setLevel(args.loglevel)<br>
+=C2=A0 =C2=A0 logger.debug(&quot;oe-go-mod-autogen.py running for %s:%s in=
 %s&quot; % (args.repo, args.rev, args.workdir))<br>
+=C2=A0 =C2=A0 gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)<b=
r>
+=C2=A0 =C2=A0 if args.test:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not args.module or not args.version:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Please specify --mod=
ule and --version&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 url, srcrev =3D gomodtool.get_url_srcrev(args.=
module, args.version)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;url =3D %s, srcrev =3D %s&quot; % =
(url, srcrev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not url or not srcrev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Failed to get url &a=
mp; srcrev for %s:%s&quot; % (args.module, args.version))<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.parse()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.sanity_check()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.gen_src_uri_inc()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.gen_relocation_inc()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.gen_modules_txt()<br>
+=C2=A0 =C2=A0 <br>
+<br>
+if __name__ =3D=3D &quot;__main__&quot;:<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D main()<br>
+=C2=A0 =C2=A0 except Exception as esc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import traceback<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 traceback.print_exc()<br>
+=C2=A0 =C2=A0 sys.exit(ret)<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8272): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8272" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8272</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101162746/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101162746/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000004eafb40604994efb--

