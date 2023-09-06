Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD43FEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.398.1693968543589974051
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 19:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jo/8qpjc;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7927f241772so129310839f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 19:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693968543; x=1694573343; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqHN3R7usFY6Imn9n67h60rW213NhZpfsdoPJxHLcFY=;
        b=jo/8qpjc/hjtcIn1PQSeEhm445dqIfclRDMGOLP40S0V6JiukgCJpGt/ccUB2KR/au
         ZMxnsQGoUGhjs16Bf8rbEpLQWbvTskFKfLNE0/GMST645YEx13/GPPWAZUljzfrfi5gP
         +Z3nzYZY74IWrnCddntIdqZdIL+h9IqCV1A4mbKyjhAn+wxXaiOkkKwrKGH6F0Tbh+Y4
         e0vRf8aE8UVmtxqpU3LzkCY4qJVnI4a95quVngn7hDPiJqt8GihrZleKf7Wt+9jciXsV
         AHzQH4J0xJ/+7UtMku1XxSWlX8f+l4RIsE9Fm4AYSOs5AA5wzjn2yyZvzLxW6T2hemjw
         /rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693968543; x=1694573343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqHN3R7usFY6Imn9n67h60rW213NhZpfsdoPJxHLcFY=;
        b=i/FAH2u0nssyi/77+wJuP7++sud0GpDB5Q9IPrRLXty7gliE6I8gudLD3mgWhZqUM9
         gQXjqjDXDHfERWF5RhSIEYAFx2ELYJitPdLii0x9QTaGg0p9X2c2dTKrewjRjOt2Yyac
         3F8kFI9uB9vUPTC6FER5ZuD/QFslXwO8hivJUq36rgE/5RYAAr8ED6W1DPVCcSd5PAv+
         BJ6nogjDcVWsp62u5fuicD/quw1ei213HMGz+cHt8MNYU+DbR5zp488308MZ47JHpqLr
         YFdcWVvoiDbzFvcys3hqvQExcYQueI5rTlWUQFo12ZKhCBXmKn54Gjf6xXC9oy+ex1D4
         znDQ==
X-Gm-Message-State: AOJu0Yw9C1WVndmIhtnC9QS+fRIwYGAvTmaw13/WeFs91orrcnmYgF9Z
	fRwlDqkpw3N4xyY1IdAZMf9Uirid8qbnYzm6ptt+XU8hYc8=
X-Google-Smtp-Source: AGHT+IHpBT/yVUhh2yyg5uk1/akGmy3Vq/QAtGpowbpuL59bwfllbiQsoOir5SctGhIVGJcR4PwJ9j7h+2114jMX6tI=
X-Received: by 2002:a6b:ec16:0:b0:792:82f8:6f90 with SMTP id
 c22-20020a6bec16000000b0079282f86f90mr16444870ioh.16.1693968542352; Tue, 05
 Sep 2023 19:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
 <CADkTA4MoM3R7Nu1XgQE+ORYN+oJTa8ubimBrZoWCubk21U93dQ@mail.gmail.com> <6f6a39cb-488e-b4bb-4847-475fb29c517b@windriver.com>
In-Reply-To: <6f6a39cb-488e-b4bb-4847-475fb29c517b@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Sep 2023 22:48:50 -0400
Message-ID: <CADkTA4O1m8xOcAHsVighCe3ye_RMYc7Siu-PJe3VD90UE+izRw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] oe-go-mod-autogen.py: add script
 to help adding/upgrading go mod recipes
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8279

On Tue, Sep 5, 2023 at 10:41=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> On 9/5/23 20:26, Bruce Ashfield wrote:
> > On Mon, Sep 4, 2023 at 11:22=E2=80=AFPM Chen Qi via lists.yoctoproject.=
org
> > <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> oe-go-mod-autogen.py is a helper script for go mod recipes. It follows
> >> Bruce's initiative about how to deal with go mod recipes in OE.
> >>
> > I thought the techniques looked familiar!
>
> Yes, indeed!
>
> With golang's current scheme, your approach is the only way to 1) make
> these non-vendored go recipes build without network connection at
> do_compile and 2) conform to OE's download mirroring mechanism. This
> really helps a lot!
>
> >
> > I was just working on my script before my holidays as my uprev cycle ha=
d
> > taken me to the non-vendored go recipes and I was running into a few
> > corner cases.
> >
> > I've got a K3S upgrade already done locally with my tweaked script, but
> > I'll take this for a test run and see if I get the same results with th=
is.
>
> I did use this script to upgrade k3s to 'v1.27.4+k3s1', only for the
> purpose of verifying this script. Those three files were correctly
> generated and the build succeeded. Hope you'll get the same result.

I'm testing the k3s update now, and there are some differences, but
they are minor and the vendoring looks good.

I'll follow up once I've done a bit more testing.

I can take care of a draft README for the script, and I will likely
bring over a few of the elements of my script (the ability to do some
module substitutions on the command line), but otherwise, I don't
see a lot of gaps .

(I was doing things like generating the relocation and src_uri
information in one run, and the modules.txt in another, but these
aren't important features, so I'll won't worry about them
when consolidating the tools).

Bruce

>
> Regards,
>
> Qi
>
> > I just didn't have the time to clean mine up to make it presentable, so
> > I'm hopeful that this will work and I can take that off my TODO list!
> >
> > Bruce
> >
> >> Example:
> >> cmd: <path_to>/meta-virtualization/scripts/oe-go-mod-autogen.py \
> >>       --repo https://github.com/docker/compose --rev v2.20.3
> >> output: src_uri.inc, relocation.inc, modules.txt
> >>
> >> Copy these three generated files to replace the original ones,
> >> then we only need update PV and SRCREV, and docker-compose is upgraded=
.
> >>
> >> Below are some technical details.
> >>
> >> * get module's repo from module name
> >>
> >>    This script checks the following two URLs to determine the module's=
 repo.
> >>    1. https://<module_name_tweaked>?=3Dgo-get=3D1
> >>    2. https://pkg.go.dev/<module_name_tweaked>
> >>
> >>    The module_name_tweaked is derived from module_name, with the last =
components
> >>    removed one by one. Let me use two examples to explain this.
> >>
> >>    For module_name sigs.k8s.io/json, the sigs.k8s.io/json is first use=
d as
> >>    module_name_tweaked for searching. And we can correctly get the rep=
o URL, so
> >>    the search stops.
> >>
> >>    For module_name github.com/k3s-io/etcd/api/v3, the following ones a=
re used
> >>    as module_name_tweaked:
> >>    github.com/k3s-io/etcd/api/v3
> >>    github.com/k3s-io/etcd/api
> >>    github.com/k3s-io/etcd
> >>    And when searching 'github.com/k3s-io/etcd', we get the repo URL, s=
o the search
> >>    stops.
> >>
> >> * determine the srcdir:destdir mapping in 'vendor' creation
> >>
> >>    To correctly form the 'vendor' directory, the mapping is critical.
> >>    This script makes use of tag matching and path matching to determin=
e
> >>    the subpath in the repo for the module.
> >>
> >> * avoid subpath being overriden by parent path
> >>
> >>    We need to avoid subpath being overriden by parent path. This is ne=
eded
> >>    for both SRC_URI ordering in src_uri.inc and the sites mapping orde=
ring
> >>    in relocation.inc. This script simply uses the length as the orderi=
ng key,
> >>    simply for the reason that if a path is a subpath of another path, =
it must
> >>    be longer.
> >>
> >> * the .git suffix is removed to sync with each other
> >>
> >>    Unlike normal recipes, go mod recipe usually have many SRC_URIs. Th=
is script
> >>    remove the '.git' suffix from repo URL so that the repo URLs are in=
 sync
> >>    with each.
> >>
> >> * basic directory hierarchy and caching mechanism
> >>
> >>    <cwd>/repos: hold the repos downloaded and checked
> >>    <cwd>/wget-contents: hold the contents to determine the module's re=
po
> >>    <cwd>/wget-contents/<module_name>.repo_url.cache: the repo value ca=
che
> >>    This is to avoid unnecessary URL fetching and repo cloning.
> >>
> >> * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script
> >>
> >>    The script must get the correct repo_url, fullsrc_rev and subpath f=
or
> >>    each required module in go.mod to correctly generate the src_uri.in=
c and
> >>    relocation.inc files. If this process fails for any required module=
, this
> >>    script stop immediately, as I deliberately set ERROR_OUT_ON_FETCH_A=
ND_CHECKOUT_FAILURE
> >>    to True in this script. The purpose is to encourage people to repor=
t
> >>    problems to meta-virt so that we can improve this script according =
to
> >>    these feedbacks. But this variable can set to False, then the scrip=
t
> >>    only records the failed modules in self.modules_unhandled with reas=
ons
> >>    added, people can modify the generated src_uri.inc and relocation.i=
nc
> >>    to manually handle these unhandled modules if they are urgent to
> >>    add/upgrade some go mod recipes.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   scripts/oe-go-mod-autogen.py | 663 +++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 663 insertions(+)
> >>   create mode 100755 scripts/oe-go-mod-autogen.py
> >>
> >> diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-autogen.=
py
> >> new file mode 100755
> >> index 00000000..09d6133b
> >> --- /dev/null
> >> +++ b/scripts/oe-go-mod-autogen.py
> >> @@ -0,0 +1,663 @@
> >> +#!/usr/bin/env python3
> >> +
> >> +import os
> >> +import sys
> >> +import logging
> >> +import argparse
> >> +from collections import OrderedDict
> >> +import subprocess
> >> +
> >> +# This switch is used to make this script error out ASAP, mainly for =
debugging purpose
> >> +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True
> >> +
> >> +logger =3D logging.getLogger('oe-go-mod-autogen')
> >> +loggerhandler =3D logging.StreamHandler()
> >> +loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(messag=
e)s"))
> >> +logger.addHandler(loggerhandler)
> >> +logger.setLevel(logging.INFO)
> >> +
> >> +class GoModTool(object):
> >> +    def __init__(self, repo, rev, workdir):
> >> +        self.repo =3D repo
> >> +        self.rev =3D rev
> >> +        self.workdir =3D workdir
> >> +
> >> +        # Stores the actual module name and its related information
> >> +        # {module: (repo_url, repo_dest_dir, fullsrcrev)}
> >> +        self.modules_repoinfo =3D {}
> >> +
> >> +        # {module_name: (url, version, destdir, fullsrcrev)}
> >> +        #
> >> +        # url: place to get the source codes, we only support git rep=
o
> >> +        # version: module version, git tag or git rev
> >> +        # destdir: place to put the fetched source codes
> >> +        # fullsrcrev: full src rev which is the value of SRC_REV
> >> +        #
> >> +        # e.g.
> >> +        # For 'github.com/Masterminds/semver/v3 v3.1.1' in go.mod:
> >> +        # module_name =3D github.com/Masterminds/semver/v3
> >> +        # url =3D https://github.com/Masterminds/semver
> >> +        # version =3D v3.1.1
> >> +        # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/github=
.com/Masterminds/semver/v3
> >> +        # fullsrcrev =3D d387ce7889a157b19ad7694dba39a562051f41b0
> >> +        self.modules_require =3D OrderedDict()
> >> +
> >> +        # {orig_module: (actual_module, actual_version)}
> >> +        self.modules_replace =3D OrderedDict()
> >> +
> >> +        # Unhandled modules
> >> +        self.modules_unhandled =3D OrderedDict()
> >> +
> >> +        # store subpaths used to form srcpath
> >> +        # {actual_module_name: subpath}
> >> +        self.modules_subpaths =3D OrderedDict()
> >> +
> >> +        # modules's actual source paths, record those that are not th=
e same with the module itself
> >> +        self.modules_srcpaths =3D OrderedDict()
> >> +
> >> +        # store lines, comment removed
> >> +        self.require_lines =3D []
> >> +        self.replace_lines =3D []
> >> +
> >> +        # fetch repo
> >> +        self.fetch_and_checkout_repo(self.repo.split('://')[1], self.=
repo, self.rev, checkout=3DTrue, get_subpath=3DFalse)
> >> +
> >> +    def show_go_mod_info(self):
> >> +        # Print modules_require, modules_replace and modules_unhandle=
d
> >> +        print("modules required:")
> >> +        for m in self.modules_require:
> >> +            url, version, destdir, fullrev =3D self.modules_require[m=
]
> >> +            print("%s %s %s %s" % (m, version, url, fullrev))
> >> +
> >> +        print("modules replace:")
> >> +        for m in self.modules_replace:
> >> +            actual_module, actual_version =3D self.modules_replace[m]
> >> +            print("%s =3D> %s %s" % (m, actual_module, actual_version=
))
> >> +
> >> +        print("modules unhandled:")
> >> +        for m in self.modules_unhandled:
> >> +            reason =3D self.modules_unhandled[m]
> >> +            print("%s unhandled: %s" % (m, reason))
> >> +
> >> +    def parse(self):
> >> +        # check if this repo needs autogen
> >> +        repo_url, repo_dest_dir, repo_fullrev =3D self.modules_repoin=
fo[self.repo.split('://')[1]]
> >> +        if os.path.isdir(os.path.join(repo_dest_dir, 'vendor')):
> >> +            logger.info("vendor direcotry has already existed for %s,=
 no need to add other repos" % self.repo)
> >> +            return
> >> +        go_mod_file =3D os.path.join(repo_dest_dir, 'go.mod')
> >> +        if not os.path.exists(go_mod_file):
> >> +            logger.info("go.mod file does not exist for %s, no need t=
o add otehr repos" % self.repo)
> >> +            return
> >> +        self.parse_go_mod(go_mod_file)
> >> +        self.show_go_mod_info()
> >> +
> >> +    def fetch_and_checkout_repo(self, module_name, repo_url, rev, def=
ault_protocol=3D'https://', checkout=3DFalse, get_subpath=3DTrue):
> >> +        """
> >> +        Fetch repo_url to <workdir>/repos/repo_base_name
> >> +        """
> >> +        protocol =3D default_protocol
> >> +        if '://' in repo_url:
> >> +            repo_url_final =3D repo_url
> >> +        else:
> >> +            repo_url_final =3D default_protocol + repo_url
> >> +        logger.debug("fetch and checkout %s %s" % (repo_url_final, re=
v))
> >> +        repos_dir =3D os.path.join(self.workdir, 'repos')
> >> +        if not os.path.exists(repos_dir):
> >> +            os.makedirs(repos_dir)
> >> +        repo_basename =3D repo_url.split('/')[-1].split('.git')[0]
> >> +        repo_dest_dir =3D os.path.join(repos_dir, repo_basename)
> >> +        module_last_name =3D module_name.split('/')[-1]
> >> +        git_action =3D "fetch"
> >> +        if os.path.exists(repo_dest_dir):
> >> +            if checkout:
> >> +                # check if current HEAD is rev
> >> +                try:
> >> +                    headrev =3D subprocess.check_output('git rev-list=
 -1 HEAD', shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
> >> +                    requiredrev =3D subprocess.check_output('git rev-=
list -1 %s 2>/dev/null || git rev-list -1 %s/%s' % (rev, module_last_name, =
rev), shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
> >> +                    if headrev =3D=3D requiredrev:
> >> +                        logger.info("%s has already been fetched and =
checked out as required, skipping" % repo_url)
> >> +                        self.modules_repoinfo[module_name] =3D (repo_=
url, repo_dest_dir, requiredrev)
> >> +                        return
> >> +                    else:
> >> +                        logger.info("HEAD of %s is not %s, will do a =
clean clone" % (repo_dest_dir, requiredrev))
> >> +                        git_action =3D "clone"
> >> +                except:
> >> +                    logger.info("'git rev-list' in %s failed, will do=
 a clean clone" % repo_dest_dir)
> >> +                    git_action =3D "clone"
> >> +            else:
> >> +                # determine if the current repo points to the desired=
 remote repo
> >> +                try:
> >> +                    remote_origin_url =3D subprocess.check_output('gi=
t config --get remote.origin.url', shell=3DTrue, cwd=3Drepo_dest_dir).decod=
e('utf-8').strip()
> >> +                    if remote_origin_url.endswith('.git'):
> >> +                        if not repo_url_final.endswith('.git'):
> >> +                            remote_origin_url =3D remote_origin_url[:=
-4]
> >> +                    else:
> >> +                        if repo_url_final.endswith('.git'):
> >> +                            remote_origin_url =3D remote_origin_url +=
 '.git'
> >> +                    if remote_origin_url !=3D repo_url_final:
> >> +                        logger.info("remote.origin.url for %s is not =
%s, will do a clean clone" % (repo_dest_dir, repo_url_final))
> >> +                        git_action =3D "clone"
> >> +                except:
> >> +                    logger.info("'git config --get remote.origin.url'=
 in %s failed, will do a clean clone" % repo_dest_dir)
> >> +                    git_action =3D "clone"
> >> +        else:
> >> +            # No local repo, clone it.
> >> +            git_action =3D "clone"
> >> +
> >> +        if git_action =3D=3D "clone":
> >> +            logger.info("Removing %s" % repo_dest_dir)
> >> +            subprocess.check_call('rm -rf %s' % repo_dest_dir, shell=
=3DTrue)
> >> +
> >> +        # clone/fetch repo
> >> +        try:
> >> +            git_cwd =3D repos_dir if git_action =3D=3D "clone" else r=
epo_dest_dir
> >> +            logger.info("git %s %s in %s" % (git_action, repo_url_fin=
al, git_cwd))
> >> +            subprocess.check_call('git %s %s >/dev/null 2>&1' % (git_=
action, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)
> >> +        except:
> >> +            logger.warning("Failed to %s %s in %s" % (git_action, rep=
o_url_final, git_cwd))
> >> +            return
> >> +
> >> +        def get_requiredrev(get_subpath):
> >> +            import re
> >> +            # check if rev is a revision or a version
> >> +            if len(rev) =3D=3D 12 and re.match('[0-9a-f]+', rev):
> >> +                rev_is_version =3D False
> >> +            else:
> >> +                rev_is_version =3D True
> >> +
> >> +            # if rev is not a version, 'git rev-list -1 <rev>' should=
 just succeed!
> >> +            if not rev_is_version:
> >> +                try:
> >> +                    rev_return =3D subprocess.check_output('git rev-l=
ist -1 %s 2>/dev/null' % rev, shell=3DTrue, cwd=3Drepo_dest_dir).decode('ut=
f-8').strip()
> >> +                    if get_subpath:
> >> +                        cmd =3D 'git branch -M toremove && git checko=
ut -b check_subpath %s && git branch -D toremove' % rev_return
> >> +                        subprocess.check_call(cmd, shell=3DTrue, cwd=
=3Drepo_dest_dir)
> >> +                        # try to get the subpath for this module
> >> +                        module_name_parts =3D module_name.split('/')
> >> +                        while (len(module_name_parts) > 0):
> >> +                            subpath =3D '/'.join(module_name_parts)
> >> +                            dir_to_check =3D repo_dest_dir + '/' + '/=
'.join(module_name_parts)
> >> +                            if os.path.isdir(dir_to_check):
> >> +                                self.modules_subpaths[module_name] =
=3D subpath
> >> +                                break
> >> +                            else:
> >> +                                module_name_parts.pop(0)
> >> +                    return rev_return
> >> +                except:
> >> +                    logger.warning("Revision (%s) not in repo(%s)" % =
(rev, repo_dest_dir))
> >> +                    return None
> >> +
> >> +            # the following codes deals with case where rev is a vers=
ion
> >> +            # determine the longest match tag, in this way, we can ge=
t the current srcpath to be used in relocation.inc
> >> +            # we first get the initial tag, which is formed from modu=
le_name and rev
> >> +            module_parts =3D module_name.split('/')
> >> +            if rev.startswith(module_parts[-1] + '.'):
> >> +                tag =3D '/'.join(module_parts[:-1]) + '/' + rev
> >> +                last_module_part_replaced =3D True
> >> +            else:
> >> +                tag =3D '/'.join(module_parts) + '/' + rev
> >> +                last_module_part_replaced =3D False
> >> +            logger.debug("use %s as the initial tag for %s" % (tag, m=
odule_name))
> >> +            tag_parts =3D tag.split('/')
> >> +            while(len(tag_parts) > 0):
> >> +                try:
> >> +                    rev_return =3D subprocess.check_output('git rev-l=
ist -1 %s 2>/dev/null' % tag, shell=3DTrue, cwd=3Drepo_dest_dir).decode('ut=
f-8').strip()
> >> +                    if len(tag_parts) > 1:
> >> +                        # ensure that the subpath exists
> >> +                        if get_subpath:
> >> +                            cmd =3D 'git branch -M toremove && git ch=
eckout -b check_subpath %s && git branch -D toremove' % rev_return
> >> +                            subprocess.check_call(cmd, shell=3DTrue, =
cwd=3Drepo_dest_dir)
> >> +                            # get subpath for the actual_module_name
> >> +                            if last_module_part_replaced:
> >> +                                subpath =3D '/'.join(tag_parts[:-1]) =
+ '/' + module_parts[-1]
> >> +                                if not os.path.isdir(repo_dest_dir + =
'/' + subpath):
> >> +                                    subpath =3D '/'.join(tag_parts[:-=
1])
> >> +                            else:
> >> +                                subpath =3D '/'.join(tag_parts[:-1])
> >> +                            if not os.path.isdir(repo_dest_dir + '/' =
+ subpath):
> >> +                                logger.warning("subpath (%s) derived =
from tag matching does not exist in %s" % (subpath, repo_dest_dir))
> >> +                                return None
> >> +                            self.modules_subpaths[module_name] =3D su=
bpath
> >> +                            logger.info("modules_subpath[%s] =3D %s" =
% (module_name, subpath))
> >> +                    return rev_return
> >> +                except:
> >> +                    tag_parts.pop(0)
> >> +                    tag =3D '/'.join(tag_parts)
> >> +            logger.warning("No tag matching %s" % rev)
> >> +            return None
> >> +
> >> +        requiredrev =3D get_requiredrev(get_subpath)
> >> +        if requiredrev:
> >> +            logger.info("Got module(%s) requiredrev: %s" % (module_na=
me, requiredrev))
> >> +            if checkout:
> >> +                subprocess.check_call('git checkout -b gomodautogen %=
s' % requiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)
> >> +            self.modules_repoinfo[module_name] =3D (repo_url, repo_de=
st_dir, requiredrev)
> >> +        else:
> >> +            logger.warning("Failed to get requiredrev, repo_url =3D %=
s, rev =3D %s, module_name =3D %s" % (repo_url, rev, module_name))
> >> +
> >> +    def parse_go_mod(self, go_mod_path):
> >> +        """
> >> +        Parse go.mod file to get the modules info
> >> +        """
> >> +        # First we get the require and replace lines
> >> +        # The parsing logic assumes the replace lines come *after* th=
e require lines
> >> +        inrequire =3D False
> >> +        inreplace =3D False
> >> +        with open(go_mod_path, 'r') as f:
> >> +            lines =3D f.readlines()
> >> +            for line in lines:
> >> +                if line.startswith('require ('):
> >> +                    inrequire =3D True
> >> +                    continue
> >> +                if line.startswith(')'):
> >> +                    inrequire =3D False
> >> +                    continue
> >> +                if line.startswith('require ') or inrequire:
> >> +                    # we have one line require
> >> +                    require_line =3D line.lstrip('require ').split('/=
/')[0].strip()
> >> +                    if require_line:
> >> +                        self.require_lines.append(require_line)
> >> +                    continue
> >> +                # we can deal with requires and replaces separately b=
ecause go.mod always writes requires before replaces
> >> +                if line.startswith('replace ('):
> >> +                    inreplace =3D True
> >> +                    continue
> >> +                if line.startswith(')'):
> >> +                    inreplace =3D False
> >> +                    continue
> >> +                if line.startswith('replace ') or inreplace:
> >> +                    replace_line =3D line.lstrip('replace ').split('/=
/')[0].strip()
> >> +                    if replace_line:
> >> +                        self.replace_lines.append(replace_line)
> >> +                    continue
> >> +        #
> >> +        # parse the require_lines and replace_lines to form self.modu=
les_require and self.modules_replace
> >> +        #
> >> +        logger.debug("Parsing require_lines and replace_lines ...")
> >> +        # A typical replace line is as below:
> >> +        #   github.com/hashicorp/golang-lru =3D> github.com/ktock/gol=
ang-lru v0.5.5-0.20211029085301-ec551be6f75c
> >> +        # It means that the github.com/hashicorp/golang-lru module is=
 replaced by github.com/ktock/golang-lru
> >> +        # with the version 'v0.5.5-0.20211029085301-ec551be6f75c'.
> >> +        # So the destdir is vendor/github.com/hashicorp/golang-lru wh=
ile the contents are from github.com/ktock/golang-lru
> >> +        for line in self.replace_lines:
> >> +            orig_module, actual =3D line.split('=3D>')
> >> +            actual_module, actual_version =3D actual.split()
> >> +            orig_module =3D orig_module.strip()
> >> +            actual_module =3D actual_module.strip()
> >> +            actual_version =3D actual_version.strip()
> >> +            self.modules_replace[orig_module] =3D (actual_module, act=
ual_version)
> >> +        #
> >> +        # Typical require lines are as below:
> >> +        #   github.com/Masterminds/semver/v3 v3.1.1
> >> +        #   golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
> >> +        #
> >> +        # We need to first try https://<module_name>?=3Dgo-get=3D1 to=
 see it contains
> >> +        # line starting with '<meta name=3D"go-import" content=3D'.
> >> +        #
> >> +        # If so, get root-path vcs repo-url from content. See https:/=
/go.dev/ref/mod#vcs-find
> >> +        # For example, the above 'wget https://golang.org/x/crypto?go=
-get=3D1' gives you
> >> +        # <meta name=3D"go-import" content=3D"golang.org/x/crypto git=
 https://go.googlesource.com/crypto">
> >> +        # In such case, the self.modules_require has the following co=
ntents:
> >> +        # module_name: golang.org/x/crypto
> >> +        # url: https://go.googlesource.com/crypto
> >> +        # version: v0.0.0-20220321153916-2c7772ba3064
> >> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/golang.or=
g/x/crypto
> >> +        # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d (git r=
ev-list -1 2c7772ba3064)
> >> +        #
> >> +        # If not, try https://pkg.go.dev/<module_name>, and find the =
'Repository'.
> >> +        # For example, 'wget https://pkg.go.dev/github.com/Mastermind=
s/semver/v3' gives:
> >> +        # github.com/Masterminds/semver
> >> +        # In such case, the self.modules has the following contents:
> >> +        # module_name: github.com/Masterminds/semver/v3
> >> +        # url: https://github.com/Masterminds/semver
> >> +        # version: v3.1.1
> >> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/Masterminds/semver/v3
> >> +        # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e (git r=
ev-list -1 v3.1.1)
> >> +        #
> >> +        # As a last resort, if the last component of <module_name> ma=
tches 'v[0-9]+',
> >> +        # remove the last component and try wget https://<module_name=
_with_last_component_removed>?go-get=3D1,
> >> +        # then try using the above matching method.
> >> +        #
> >> +        for line in self.require_lines:
> >> +            module_name, version =3D line.strip().split()
> >> +            logger.debug("require line: %s" % line)
> >> +            logger.debug("module_name =3D %s; version =3D %s" % (modu=
le_name, version))
> >> +            # take the modules_replace into consideration to get the =
actual version and actual module name
> >> +            # note that the module_name is used in destdir, and the a=
ctual_module_name and actual_version
> >> +            # are used to determine the url and fullsrcrev
> >> +            destdir =3D '${WORKDIR}/${BP}/src/import/vendor.fetch/%s'=
 % module_name
> >> +            actual_module_name =3D module_name
> >> +            actual_version =3D version
> >> +            if module_name in self.modules_replace:
> >> +                actual_module_name, actual_version =3D self.modules_r=
eplace[module_name]
> >> +            logger.debug("actual_module_name =3D %s; actual_version =
=3D %s" % (actual_module_name, actual_version))
> >> +            url, fullsrcrev =3D self.get_url_srcrev(actual_module_nam=
e, actual_version)
> >> +            logger.debug("url =3D %s; fullsrcrev =3D %s" % (url, full=
srcrev))
> >> +            if url and fullsrcrev:
> >> +                self.modules_require[module_name] =3D (url, version, =
destdir, fullsrcrev)
> >> +                # form srcpath, actual_module_name/<subpath>
> >> +                if actual_module_name in self.modules_subpaths:
> >> +                    subpath =3D self.modules_subpaths[actual_module_n=
ame]
> >> +                    srcpath =3D '%s/%s' % (actual_module_name, subpat=
h)
> >> +                    self.modules_srcpaths[module_name] =3D srcpath
> >> +                    logger.info("self.modules_srcpaths[%s] =3D %s" % =
(module_name, srcpath))
> >> +                else:
> >> +                    self.modules_srcpaths[module_name] =3D actual_mod=
ule_name
> >> +            else:
> >> +                logger.warning("get_url_srcrev(%s, %s) failed" % (act=
ual_module_name, actual_version))
> >> +                if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:
> >> +                    sys.exit(1)
> >> +
> >> +    def use_wget_to_get_repo_url(self, wget_content_file, url_cache_f=
ile, module_name):
> >> +        """
> >> +        Use wget to get repo_url for module_name, return None if not =
found
> >> +        """
> >> +        try:
> >> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1" % (wget=
_content_file, module_name))
> >> +            subprocess.check_call('wget -O %s https://%s?=3Dgo-get=3D=
1' % (wget_content_file, module_name), shell=3DTrue)
> >> +            with open(wget_content_file, 'r') as f:
> >> +                for line in f.readlines():
> >> +                    if '<meta name=3D"go-import" content=3D' in line:
> >> +                        logger.info("Succeed to find go-import conten=
t for %s" % module_name)
> >> +                        logger.debug("The line is %s" % line)
> >> +                        root_path, vcs, repo_url =3D line.split('cont=
ent=3D')[1].split('"')[1].split()
> >> +                        logger.info("%s: %s %s %s" % (module_name, ro=
ot_path, vcs, repo_url))
> >> +                        if vcs !=3D 'git':
> >> +                            logger.warning('%s unhandled as its vcs i=
s %s which is not supported by this script.' % (module_name, vcs))
> >> +                            unhandled_reason =3D 'vcs %s is not suppo=
rted by this script' % vcs
> >> +                            self.modules_unhandled[module_name] =3D u=
nhandled_reason
> >> +                            return None
> >> +                        with open(url_cache_file, 'w') as f:
> >> +                            f.write(repo_url)
> >> +                        return repo_url
> >> +        except:
> >> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1 failed" =
% (wget_content_file, module_name))
> >> +        # if we cannot find repo url from https://<module_name>?=3Dgo=
-get=3D1, try https://pkg.go/dev/<module_name>
> >> +        try:
> >> +            logger.info("wget -O %s https://pkg.go.dev/%s" % (wget_co=
ntent_file, module_name))
> >> +            subprocess.check_call("wget -O %s https://pkg.go.dev/%s" =
% (wget_content_file, module_name), shell=3DTrue)
> >> +            repo_url_found =3D False
> >> +            with open(wget_content_file, 'r') as f:
> >> +                in_repo_section =3D False
> >> +                for line in f.readlines():
> >> +                    if '>Repository<' in line:
> >> +                        in_repo_section =3D True
> >> +                        continue
> >> +                    if in_repo_section:
> >> +                        newline =3D line.strip()
> >> +                        if newline !=3D '' and not newline.startswith=
('<'):
> >> +                            repo_url =3D newline
> >> +                            repo_url_found =3D True
> >> +                            break
> >> +            if repo_url_found:
> >> +                logger.info("repo url for %s: %s" % (module_name, rep=
o_url))
> >> +                with open(url_cache_file, 'w') as f:
> >> +                    f.write(repo_url)
> >> +                return repo_url
> >> +            else:
> >> +                unhandled_reason =3D 'cannot determine repo_url for %=
s' % module_name
> >> +                self.modules_unhandled[module_name] =3D unhandled_rea=
son
> >> +                return None
> >> +        except:
> >> +            logger.info("wget -O %s https://pkg.go.dev/%s failed" % (=
wget_content_file, module_name))
> >> +            return None
> >> +
> >> +
> >> +    def get_repo_url_rev(self, module_name, version):
> >> +        """
> >> +        Return (repo_url, rev)
> >> +        """
> >> +        import re
> >> +        # First get rev from version
> >> +        v =3D version.split('+incompatible')[0]
> >> +        version_components =3D v.split('-')
> >> +        if len(version_components) =3D=3D 1:
> >> +            rev =3D v
> >> +        elif len(version_components) =3D=3D 3:
> >> +            if len(version_components[2]) =3D=3D 12:
> >> +                rev =3D version_components[2]
> >> +            else:
> >> +                rev =3D v
> >> +        else:
> >> +            rev =3D v
> >> +
> >> +        #
> >> +        # Get repo_url
> >> +        # We put a cache mechanism here, <wget_content_file>.repo_url=
.cache is used to store the repo url fetch before
> >> +        #
> >> +        wget_dir =3D os.path.join(self.workdir, 'wget-contents')
> >> +        if not os.path.exists(wget_dir):
> >> +            os.makedirs(wget_dir)
> >> +        wget_content_file =3D os.path.join(wget_dir, module_name.repl=
ace('/', '_'))
> >> +        url_cache_file =3D "%s.repo_url.cache" % wget_content_file
> >> +        if os.path.exists(url_cache_file):
> >> +            with open(url_cache_file, 'r') as f:
> >> +                repo_url =3D f.readline().strip()
> >> +                return (repo_url, rev)
> >> +        module_name_parts =3D module_name.split('/')
> >> +        while (len(module_name_parts) > 0):
> >> +            module_name_to_check =3D '/'.join(module_name_parts)
> >> +            logger.info("module_name_to_check: %s" % module_name_to_c=
heck)
> >> +            repo_url =3D self.use_wget_to_get_repo_url(wget_content_f=
ile, url_cache_file, module_name_to_check)
> >> +            if repo_url:
> >> +                return (repo_url, rev)
> >> +            else:
> >> +                if module_name in self.modules_unhandled:
> >> +                    return (None, rev)
> >> +                else:
> >> +                    module_name_parts.pop(-1)
> >> +
> >> +        unhandled_reason =3D 'cannot determine the repo for %s' % mod=
ule_name
> >> +        self.modules_unhandled[module_name] =3D unhandled_reason
> >> +        return (None, rev)
> >> +
> >> +    def get_url_srcrev(self, module_name, version):
> >> +        """
> >> +        Return url and fullsrcrev according to module_name and versio=
n
> >> +        """
> >> +        repo_url, rev =3D self.get_repo_url_rev(module_name, version)
> >> +        if not repo_url or not rev:
> >> +            return (None, None)
> >> +        self.fetch_and_checkout_repo(module_name, repo_url, rev)
> >> +        if module_name in self.modules_repoinfo:
> >> +            repo_url, repo_dest_dir, repo_fullrev =3D self.modules_re=
poinfo[module_name]
> >> +            # remove the .git suffix to sync repos across modules wit=
h different versions and across recipes
> >> +            if repo_url.endswith('.git'):
> >> +                repo_url =3D repo_url[:-len('.git')]
> >> +            return (repo_url, repo_fullrev)
> >> +        else:
> >> +            unhandled_reason =3D 'fetch_and_checkout_repo(%s, %s, %s)=
 failed' % (module_name, repo_url, rev)
> >> +            self.modules_unhandled[module_name] =3D unhandled_reason
> >> +            return (None, None)
> >> +
> >> +    def gen_src_uri_inc(self):
> >> +        """
> >> +        Generate src_uri.inc file containing SRC_URIs
> >> +        """
> >> +        src_uri_inc_file =3D os.path.join(self.workdir, 'src_uri.inc'=
)
> >> +        # record the <name> after writting SRCREV_<name>, this is to =
avoid modules having the same basename resulting in same SRCREV_xxx
> >> +        srcrev_name_recorded =3D []
> >> +        template =3D """#       %s %s
> >> +# [1] git ls-remote %s %s
> >> +SRCREV_%s=3D"%s"
> >> +SRC_URI +=3D "git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/%s"
> >> +
> >> +"""
> >> +        # We can't simply write SRC_URIs one by one in the order that=
 go.mod specify them.
> >> +        # Because the latter one might clean things up for the former=
 one if the former one is a subpath of the latter one.
> >> +        def take_first_len(elem):
> >> +            return len(elem[0])
> >> +
> >> +        src_uri_contents =3D []
> >> +        with open(src_uri_inc_file, 'w') as f:
> >> +            for module in self.modules_require:
> >> +                # {module_name: (url, version, destdir, fullsrcrev)}
> >> +                repo_url, version, destdir, fullrev =3D self.modules_=
require[module]
> >> +                if module in self.modules_replace:
> >> +                    actual_module_name, actual_version =3D self.modul=
es_replace[module]
> >> +                else:
> >> +                    actual_module_name, actual_version =3D (module, v=
ersion)
> >> +                if '://' in repo_url:
> >> +                    repo_url_noprotocol =3D repo_url.split('://')[1]
> >> +                else:
> >> +                    repo_url_noprotocol =3D repo_url
> >> +                if not repo_url.startswith('https://'):
> >> +                    repo_url =3D 'https://' + repo_url
> >> +                name =3D module.split('/')[-1]
> >> +                if name in srcrev_name_recorded:
> >> +                    name =3D '-'.join(module.split('/')[-2:])
> >> +                src_uri_contents.append((actual_module_name, actual_v=
ersion, repo_url, fullrev, name, fullrev, repo_url_noprotocol, name, actual=
_module_name))
> >> +                srcrev_name_recorded.append(name)
> >> +            # sort the src_uri_contents and then write it
> >> +            src_uri_contents.sort(key=3Dtake_first_len)
> >> +            for content in src_uri_contents:
> >> +                f.write(template % content)
> >> +        logger.info("%s generated" % src_uri_inc_file)
> >> +
> >> +    def gen_relocation_inc(self):
> >> +        """
> >> +        Generate relocation.inc file
> >> +        """
> >> +        relocation_inc_file =3D os.path.join(self.workdir, 'relocatio=
n.inc')
> >> +        template =3D """export sites=3D"%s"
> >> +
> >> +do_compile:prepend() {
> >> +    cd ${S}/src/import
> >> +    for s in $sites; do
> >> +        site_dest=3D$(echo $s | cut -d: -f1)
> >> +        site_source=3D$(echo $s | cut -d: -f2)
> >> +        force_flag=3D$(echo $s | cut -d: -f3)
> >> +        mkdir -p vendor.copy/$site_dest
> >> +        if [ -n "$force_flag" ]; then
> >> +           echo "[INFO] $site_dest: force copying .go files"
> >> +           rm -rf vendor.copy/$site_dest
> >> +           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.=
fetch/$site_source/ vendor.copy/$site_dest
> >> +        else
> >> +            [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" =
] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skippe=
d (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go fil=
es" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fetch/$site=
_source/ vendor.copy/$site_dest ; }
> >> +        fi
> >> +    done
> >> +}
> >> +"""
> >> +        sites =3D []
> >> +        for module in self.modules_require:
> >> +            # <dest>:<source>[:force]
> >> +            if module in self.modules_srcpaths:
> >> +                srcpath =3D self.modules_srcpaths[module]
> >> +                logger.debug("Using %s as srcpath of module (%s)" % (=
srcpath, module))
> >> +            else:
> >> +                srcpath =3D module
> >> +            sites.append("%s:%s:force" % (module, srcpath))
> >> +        # To avoid the former one being overriden by the latter one w=
hen the former one is a subpath of the latter one, sort sites
> >> +        sites.sort(key=3Dlen)
> >> +        with open(relocation_inc_file, 'w') as f:
> >> +            sites_str =3D ' \\\n           '.join(sites)
> >> +            f.write(template % sites_str)
> >> +        logger.info("%s generated" % relocation_inc_file)
> >> +
> >> +    def gen_modules_txt(self):
> >> +        """
> >> +        Generate modules.txt file
> >> +        """
> >> +        modules_txt_file =3D os.path.join(self.workdir, 'modules.txt'=
)
> >> +        with open(modules_txt_file, 'w') as f:
> >> +            for l in self.require_lines:
> >> +                f.write('# %s\n' % l)
> >> +                f.write('## explicit\n')
> >> +            for l in self.replace_lines:
> >> +                f.write('# %s\n' %l)
> >> +        logger.info("%s generated" % modules_txt_file)
> >> +
> >> +    def sanity_check(self):
> >> +        """
> >> +        Various anity checks
> >> +        """
> >> +        sanity_check_ok =3D True
> >> +        #
> >> +        # Sanity Check 1:
> >> +        #     For modules having the same repo, at most one is allowe=
d to not have subpath.
> >> +        #     This check operates on self.modules_repoinfo and self.m=
odules_subpaths
> >> +        #
> >> +        repo_modules =3D {}
> >> +        for module in self.modules_repoinfo:
> >> +            # first form {repo: [module1, module2, ...]}
> >> +            repo_url, repo_dest_dir, fullsrcrev =3D self.modules_repo=
info[module]
> >> +            if repo_url not in repo_modules:
> >> +                repo_modules[repo_url] =3D [module]
> >> +            else:
> >> +                repo_modules[repo_url].append(module)
> >> +        for repo in repo_modules:
> >> +            modules =3D repo_modules[repo]
> >> +            if len(modules) =3D=3D 1:
> >> +                continue
> >> +            # for modules sharing the same repo, at most one is allow=
ed to not have subpath
> >> +            nosubpath_modules =3D []
> >> +            for m in modules:
> >> +                if m not in self.modules_subpaths:
> >> +                    nosubpath_modules.append(m)
> >> +            if len(nosubpath_modules) =3D=3D 0:
> >> +                continue
> >> +            if len(nosubpath_modules) > 1:
> >> +                logger.warning("Multiple modules sharing %s, but they=
 don't have subpath: %s. Please double check." % (repo, nosubpath_modules))
> >> +            if len(nosubpath_modules) =3D=3D 1:
> >> +                # do further check, OK if the module is the prefix fo=
r other modules sharing the same repo
> >> +                module_to_check =3D nosubpath_modules[0]
> >> +                for m in modules:
> >> +                    if module_to_check =3D=3D m:
> >> +                        continue
> >> +                    if not m.startswith('%s/' % module_to_check):
> >> +                        logger.warning("%s is sharing repo (%s) with =
other modules, and it might need a subpath. Please double check" % (module_=
to_check, repo))
> >> +                        continue
> >> +
> >> +        #
> >> +        # End of Sanity Check
> >> +        #
> >> +        if not sanity_check_ok:
> >> +            sys.exit(1)
> >> +        return
> >> +
> >> +def main():
> >> +    parser =3D argparse.ArgumentParser(
> >> +        description=3D"oe-go-mod-autogen.py is used to generate src_u=
ri.inc, relocation.inc and modules.txt to be used by go mod recipes",
> >> +        epilog=3D"Use %(prog)s --help to get help")
> >> +    parser.add_argument("--repo", help =3D "Repo for the recipe.", re=
quired=3DTrue)
> >> +    parser.add_argument("--rev", help =3D "Revision for the recipe.",=
 required=3DTrue)
> >> +    parser.add_argument("--module", help =3D "Go module name. To be u=
sed with '--test'")
> >> +    parser.add_argument("--version", help =3D "Go module version. To =
be used with '--test'")
> >> +    parser.add_argument("--test", help =3D "Test to get repo url and =
fullsrcrev, used together with --module and --version.", action=3D"store_tr=
ue")
> >> +    parser.add_argument("--workdir", help =3D "Working directory to h=
old intermediate results and output.", default=3Dos.getcwd())
> >> +    parser.add_argument("-d", "--debug",
> >> +                        help =3D "Enable debug output",
> >> +                        action=3D"store_const", const=3Dlogging.DEBUG=
, dest=3D"loglevel", default=3Dlogging.INFO)
> >> +    parser.add_argument("-q", "--quiet",
> >> +                        help =3D "Hide all output except error messag=
es",
> >> +                        action=3D"store_const", const=3Dlogging.ERROR=
, dest=3D"loglevel")
> >> +    args =3D parser.parse_args()
> >> +
> >> +    logger.setLevel(args.loglevel)
> >> +    logger.debug("oe-go-mod-autogen.py running for %s:%s in %s" % (ar=
gs.repo, args.rev, args.workdir))
> >> +    gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)
> >> +    if args.test:
> >> +        if not args.module or not args.version:
> >> +            print("Please specify --module and --version")
> >> +            sys.exit(1)
> >> +        url, srcrev =3D gomodtool.get_url_srcrev(args.module, args.ve=
rsion)
> >> +        print("url =3D %s, srcrev =3D %s" % (url, srcrev))
> >> +        if not url or not srcrev:
> >> +            print("Failed to get url & srcrev for %s:%s" % (args.modu=
le, args.version))
> >> +    else:
> >> +        gomodtool.parse()
> >> +        gomodtool.sanity_check()
> >> +        gomodtool.gen_src_uri_inc()
> >> +        gomodtool.gen_relocation_inc()
> >> +        gomodtool.gen_modules_txt()
> >> +
> >> +
> >> +if __name__ =3D=3D "__main__":
> >> +    try:
> >> +        ret =3D main()
> >> +    except Exception as esc:
> >> +        ret =3D 1
> >> +        import traceback
> >> +        traceback.print_exc()
> >> +    sys.exit(ret)
> >> --
> >> 2.40.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#8272): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8272
> >> Mute This Topic: https://lists.yoctoproject.org/mt/101162746/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

