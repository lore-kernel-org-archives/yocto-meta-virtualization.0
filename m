Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366C3EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 10:33:30 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.55399.1694428405449122953
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 03:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GDSiOjaA;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7a754db0fbcso1371710241.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Sep 2023 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694428404; x=1695033204; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt/0wCodxt9rcs00Kuc5Mw82HC6rinOJwMYArR55dsg=;
        b=GDSiOjaAzECN1j/oKei9Io0lwVG4bd4/zS+QNigwVXeeJJm2Pfro3OfRvJoow+ySQP
         50KW7AGLgtgv+hWMBBPX2nzXfwchkYTWnZ7zK3SPTCv9rgPUHiEmi3jwGP+BeZeAnaO1
         i/T/rq0MnqXT9Y0s2hWyXVNM0ixzv+XBppDfNt0rz+aOO4pl1ezTTJv2N1lO5xdF9r+Q
         3+wMTk3X6X7i5/yxURiA4HyJrmpxciVp9xud4kGxHwW5bGCbjwRBUwWmtBpkzcZ8cnsI
         tqAFU+ROk8d66LIiDgKcLfrJzysuZySJRo2qn4DqI3pDSvZKQKCmEJZcyKb03JyEfA28
         2vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428404; x=1695033204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vt/0wCodxt9rcs00Kuc5Mw82HC6rinOJwMYArR55dsg=;
        b=LyBl8yD5thIy0qgPaKh+mdI+M6BXXjVcLsMIt8NF7ECW6HSfsTTrJzU6yypWzi7B1I
         PUaQwOC5yivsObS1c60nsps1foxCm16w/c2gN++/0iwtMUTZht92h96Ok2Krd2mr8tyu
         ihx0OyrY6LKFXsDzB9ekSO9QUjVwADAzjKva2j0wuhXyFFjyfMHH1EenhBwYQtURYxw0
         hR1ypfh/QpG++HeoGYnlJ5Bov6JQMtRCu9nkl3+ALkovCgjUMW2bkjrxv+ojILu2mvO2
         lkt6z1TlBGQzGQRLWiRQ3WLPG4qOFfQpEqFcJH1F+BUTgZu5XQr1t9jm6tQuDWiHbFb2
         lT0A==
X-Gm-Message-State: AOJu0Yw2AOpcc/0LrOY5ZQvM+eBRZ9ps8HHNssZI53EpYkbudLwwjpDy
	cubIbNCcTkF+17A0a9mn58HgyT2cSaC/EqJbHW4=
X-Google-Smtp-Source: AGHT+IE+LasnF1NHa2Pl1i3bB/hEJSLzcVuU/0EwqcXhEdf8Wn23WVLYEX/xDbRPqoLSCnC7XVRkS0KcmmHulyvE81I=
X-Received: by 2002:a67:eb19:0:b0:44d:4c28:55ca with SMTP id
 a25-20020a67eb19000000b0044d4c2855camr8177560vso.16.1694428403959; Mon, 11
 Sep 2023 03:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
 <CADkTA4MoM3R7Nu1XgQE+ORYN+oJTa8ubimBrZoWCubk21U93dQ@mail.gmail.com>
 <6f6a39cb-488e-b4bb-4847-475fb29c517b@windriver.com> <17822F6A670423F9.2662@lists.yoctoproject.org>
 <CADkTA4NA-sZKYseM-qDKWPnLf4nUh-u=R1hyeJoV_VGjF3269Q@mail.gmail.com>
 <cf4bc1d7-a251-13c1-528c-8d0db2b6ef81@windriver.com> <CADkTA4N6eDpN4+ROR4FtbL=om5_TJFTHc7GG9WJ7t+ROAYdeUA@mail.gmail.com>
In-Reply-To: <CADkTA4N6eDpN4+ROR4FtbL=om5_TJFTHc7GG9WJ7t+ROAYdeUA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 11 Sep 2023 11:33:12 +0100
Message-ID: <CANPvuRk66ggdEjNYF6P_gapjF+mnzB6zmrCM9mfR7Ytvea-ZAQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] oe-go-mod-autogen.py: add script
 to help adding/upgrading go mod recipes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ChenQi <Qi.Chen@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001d8e07060512dbbf"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Sep 2023 10:33:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8293

--0000000000001d8e07060512dbbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia sexta, 8/09/2023
=C3=A0(s) 21:05:

> Indeed.
>
> I've worked around the issues, and have ported a few of my changes to
> your script to make it work similarly to mine in my update environment.
>
> I have more changes to port, but this is enough for now.
>
> You'll see my documentation and --help updates on master-next.
>
> Bruce
>

Thanks for creating the readme.

Jose


>
>
> On Thu, Sep 7, 2023 at 10:31=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wr=
ote:
> >
> > On 9/8/23 05:09, Bruce Ashfield wrote:
> > > On Tue, Sep 5, 2023 at 10:49=E2=80=AFPM Bruce Ashfield via
> > > lists.yoctoproject.org
> > > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >> On Tue, Sep 5, 2023 at 10:41=E2=80=AFPM ChenQi <Qi.Chen@windriver.co=
m> wrote:
> > >>> On 9/5/23 20:26, Bruce Ashfield wrote:
> > >>>> On Mon, Sep 4, 2023 at 11:22=E2=80=AFPM Chen Qi via lists.yoctopro=
ject.org
> > >>>> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> > >>>>> From: Chen Qi <Qi.Chen@windriver.com>
> > >>>>>
> > >>>>> oe-go-mod-autogen.py is a helper script for go mod recipes. It
> follows
> > >>>>> Bruce's initiative about how to deal with go mod recipes in OE.
> > >>>>>
> > >>>> I thought the techniques looked familiar!
> > >>> Yes, indeed!
> > >>>
> > >>> With golang's current scheme, your approach is the only way to 1)
> make
> > >>> these non-vendored go recipes build without network connection at
> > >>> do_compile and 2) conform to OE's download mirroring mechanism. Thi=
s
> > >>> really helps a lot!
> > >>>
> > >>>> I was just working on my script before my holidays as my uprev
> cycle had
> > >>>> taken me to the non-vendored go recipes and I was running into a f=
ew
> > >>>> corner cases.
> > >>>>
> > >>>> I've got a K3S upgrade already done locally with my tweaked script=
,
> but
> > >>>> I'll take this for a test run and see if I get the same results
> with this.
> > >>> I did use this script to upgrade k3s to 'v1.27.4+k3s1', only for th=
e
> > >>> purpose of verifying this script. Those three files were correctly
> > >>> generated and the build succeeded. Hope you'll get the same result.
> > >> I'm testing the k3s update now, and there are some differences, but
> > >> they are minor and the vendoring looks good.
> > >>
> > >> I'll follow up once I've done a bit more testing.
> > >>
> > >> I can take care of a draft README for the script, and I will likely
> > >> bring over a few of the elements of my script (the ability to do som=
e
> > >> module substitutions on the command line), but otherwise, I don't
> > >> see a lot of gaps .
> > > I've started on a README describing how to run the tool, and have
> > > spent quite a bit of time with the script now (I was using more
> > > heuristics to find the source repository, but using the go VCS
> > > information makes things work much simpler .. which is of course
> > > what you are doing).
> > >
> > > I've also ported some of my changes over (flags, and the ability
> > > to track a branch (which I now realize I probably don't really need).
> > >
> > > That being said, k3s is now failing during processing:
> > >
> > > WARNING: Revision (ec00e662324e) not in
> > > repo(/opt/bruce/poky/meta-virtualization/repos/nats.go)
> > > WARNING: Failed to get requiredrev, repo_url =3D
> > > https://github.com/nats-io/nats.go.git, rev =3D ec00e662324e,
> > > module_name =3D github.com/nats-io/nats.go
> > > WARNING: get_url_srcrev(github.com/nats-io/nats.go,
> > > v1.27.1-0.20230619112143-ec00e662324e) failed
> > >
> > > I'm looking into that issue now.
> > >
> > > I had a more complicated semver regex to pull out the revisions, but
> in this
> > > case, it does appear to be looking for the correct revision in the
> repository.
> > >
> > > I'm out of time for it today, but will continue working with it
> tomorrow.
> > >
> > > Bruce
> > >
> > Hi Bruce,
> >
> > Yes, I just double checked the https://github.com/nats-io/nats.go repo,
> > the resivion 'ec00e662324e' does not exist.
> >
> > In k3s master branch, there's a commit to bump its version.
> >
> > -       github.com/nats-io/nats.go v1.27.1-0.20230619112143-ec00e662324=
e
> > // indirect
> > +       github.com/nats-io/nats.go v1.27.1 // indirect
> >
> > But for v1.27.5+k3s1, the go.mod file is using 'ec00e662324e'.
> >
> > I've filed an issue for k3s: https://github.com/k3s-io/k3s/issues/8320.
> > Let's see how k3s community responds to this.
> >
> > Regards,
> >
> > Qi
> >
> >
> > >> (I was doing things like generating the relocation and src_uri
> > >> information in one run, and the modules.txt in another, but these
> > >> aren't important features, so I'll won't worry about them
> > >> when consolidating the tools).
> > >>
> > >> Bruce
> > >>
> > >>> Regards,
> > >>>
> > >>> Qi
> > >>>
> > >>>> I just didn't have the time to clean mine up to make it
> presentable, so
> > >>>> I'm hopeful that this will work and I can take that off my TODO
> list!
> > >>>>
> > >>>> Bruce
> > >>>>
> > >>>>> Example:
> > >>>>> cmd: <path_to>/meta-virtualization/scripts/oe-go-mod-autogen.py \
> > >>>>>        --repo https://github.com/docker/compose --rev v2.20.3
> > >>>>> output: src_uri.inc, relocation.inc, modules.txt
> > >>>>>
> > >>>>> Copy these three generated files to replace the original ones,
> > >>>>> then we only need update PV and SRCREV, and docker-compose is
> upgraded.
> > >>>>>
> > >>>>> Below are some technical details.
> > >>>>>
> > >>>>> * get module's repo from module name
> > >>>>>
> > >>>>>     This script checks the following two URLs to determine the
> module's repo.
> > >>>>>     1. https://<module_name_tweaked>?=3Dgo-get=3D1
> > >>>>>     2. https://pkg.go.dev/<module_name_tweaked>
> > >>>>>
> > >>>>>     The module_name_tweaked is derived from module_name, with the
> last components
> > >>>>>     removed one by one. Let me use two examples to explain this.
> > >>>>>
> > >>>>>     For module_name sigs.k8s.io/json, the sigs.k8s.io/json is
> first used as
> > >>>>>     module_name_tweaked for searching. And we can correctly get
> the repo URL, so
> > >>>>>     the search stops.
> > >>>>>
> > >>>>>     For module_name github.com/k3s-io/etcd/api/v3, the following
> ones are used
> > >>>>>     as module_name_tweaked:
> > >>>>>     github.com/k3s-io/etcd/api/v3
> > >>>>>     github.com/k3s-io/etcd/api
> > >>>>>     github.com/k3s-io/etcd
> > >>>>>     And when searching 'github.com/k3s-io/etcd', we get the repo
> URL, so the search
> > >>>>>     stops.
> > >>>>>
> > >>>>> * determine the srcdir:destdir mapping in 'vendor' creation
> > >>>>>
> > >>>>>     To correctly form the 'vendor' directory, the mapping is
> critical.
> > >>>>>     This script makes use of tag matching and path matching to
> determine
> > >>>>>     the subpath in the repo for the module.
> > >>>>>
> > >>>>> * avoid subpath being overriden by parent path
> > >>>>>
> > >>>>>     We need to avoid subpath being overriden by parent path. This
> is needed
> > >>>>>     for both SRC_URI ordering in src_uri.inc and the sites mappin=
g
> ordering
> > >>>>>     in relocation.inc. This script simply uses the length as the
> ordering key,
> > >>>>>     simply for the reason that if a path is a subpath of another
> path, it must
> > >>>>>     be longer.
> > >>>>>
> > >>>>> * the .git suffix is removed to sync with each other
> > >>>>>
> > >>>>>     Unlike normal recipes, go mod recipe usually have many
> SRC_URIs. This script
> > >>>>>     remove the '.git' suffix from repo URL so that the repo URLs
> are in sync
> > >>>>>     with each.
> > >>>>>
> > >>>>> * basic directory hierarchy and caching mechanism
> > >>>>>
> > >>>>>     <cwd>/repos: hold the repos downloaded and checked
> > >>>>>     <cwd>/wget-contents: hold the contents to determine the
> module's repo
> > >>>>>     <cwd>/wget-contents/<module_name>.repo_url.cache: the repo
> value cache
> > >>>>>     This is to avoid unnecessary URL fetching and repo cloning.
> > >>>>>
> > >>>>> * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script
> > >>>>>
> > >>>>>     The script must get the correct repo_url, fullsrc_rev and
> subpath for
> > >>>>>     each required module in go.mod to correctly generate the
> src_uri.inc and
> > >>>>>     relocation.inc files. If this process fails for any required
> module, this
> > >>>>>     script stop immediately, as I deliberately set
> ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE
> > >>>>>     to True in this script. The purpose is to encourage people to
> report
> > >>>>>     problems to meta-virt so that we can improve this script
> according to
> > >>>>>     these feedbacks. But this variable can set to False, then the
> script
> > >>>>>     only records the failed modules in self.modules_unhandled wit=
h
> reasons
> > >>>>>     added, people can modify the generated src_uri.inc and
> relocation.inc
> > >>>>>     to manually handle these unhandled modules if they are urgent
> to
> > >>>>>     add/upgrade some go mod recipes.
> > >>>>>
> > >>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >>>>> ---
> > >>>>>    scripts/oe-go-mod-autogen.py | 663
> +++++++++++++++++++++++++++++++++++
> > >>>>>    1 file changed, 663 insertions(+)
> > >>>>>    create mode 100755 scripts/oe-go-mod-autogen.py
> > >>>>>
> > >>>>> diff --git a/scripts/oe-go-mod-autogen.py
> b/scripts/oe-go-mod-autogen.py
> > >>>>> new file mode 100755
> > >>>>> index 00000000..09d6133b
> > >>>>> --- /dev/null
> > >>>>> +++ b/scripts/oe-go-mod-autogen.py
> > >>>>> @@ -0,0 +1,663 @@
> > >>>>> +#!/usr/bin/env python3
> > >>>>> +
> > >>>>> +import os
> > >>>>> +import sys
> > >>>>> +import logging
> > >>>>> +import argparse
> > >>>>> +from collections import OrderedDict
> > >>>>> +import subprocess
> > >>>>> +
> > >>>>> +# This switch is used to make this script error out ASAP, mainly
> for debugging purpose
> > >>>>> +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True
> > >>>>> +
> > >>>>> +logger =3D logging.getLogger('oe-go-mod-autogen')
> > >>>>> +loggerhandler =3D logging.StreamHandler()
> > >>>>> +loggerhandler.setFormatter(logging.Formatter("%(levelname)s:
> %(message)s"))
> > >>>>> +logger.addHandler(loggerhandler)
> > >>>>> +logger.setLevel(logging.INFO)
> > >>>>> +
> > >>>>> +class GoModTool(object):
> > >>>>> +    def __init__(self, repo, rev, workdir):
> > >>>>> +        self.repo =3D repo
> > >>>>> +        self.rev =3D rev
> > >>>>> +        self.workdir =3D workdir
> > >>>>> +
> > >>>>> +        # Stores the actual module name and its related
> information
> > >>>>> +        # {module: (repo_url, repo_dest_dir, fullsrcrev)}
> > >>>>> +        self.modules_repoinfo =3D {}
> > >>>>> +
> > >>>>> +        # {module_name: (url, version, destdir, fullsrcrev)}
> > >>>>> +        #
> > >>>>> +        # url: place to get the source codes, we only support gi=
t
> repo
> > >>>>> +        # version: module version, git tag or git rev
> > >>>>> +        # destdir: place to put the fetched source codes
> > >>>>> +        # fullsrcrev: full src rev which is the value of SRC_REV
> > >>>>> +        #
> > >>>>> +        # e.g.
> > >>>>> +        # For 'github.com/Masterminds/semver/v3 v3.1.1' in
> go.mod:
> > >>>>> +        # module_name =3D github.com/Masterminds/semver/v3
> > >>>>> +        # url =3D https://github.com/Masterminds/semver
> > >>>>> +        # version =3D v3.1.1
> > >>>>> +        # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/
> github.com/Masterminds/semver/v3
> > >>>>> +        # fullsrcrev =3D d387ce7889a157b19ad7694dba39a562051f41b=
0
> > >>>>> +        self.modules_require =3D OrderedDict()
> > >>>>> +
> > >>>>> +        # {orig_module: (actual_module, actual_version)}
> > >>>>> +        self.modules_replace =3D OrderedDict()
> > >>>>> +
> > >>>>> +        # Unhandled modules
> > >>>>> +        self.modules_unhandled =3D OrderedDict()
> > >>>>> +
> > >>>>> +        # store subpaths used to form srcpath
> > >>>>> +        # {actual_module_name: subpath}
> > >>>>> +        self.modules_subpaths =3D OrderedDict()
> > >>>>> +
> > >>>>> +        # modules's actual source paths, record those that are
> not the same with the module itself
> > >>>>> +        self.modules_srcpaths =3D OrderedDict()
> > >>>>> +
> > >>>>> +        # store lines, comment removed
> > >>>>> +        self.require_lines =3D []
> > >>>>> +        self.replace_lines =3D []
> > >>>>> +
> > >>>>> +        # fetch repo
> > >>>>> +        self.fetch_and_checkout_repo(self.repo.split('://')[1],
> self.repo, self.rev, checkout=3DTrue, get_subpath=3DFalse)
> > >>>>> +
> > >>>>> +    def show_go_mod_info(self):
> > >>>>> +        # Print modules_require, modules_replace and
> modules_unhandled
> > >>>>> +        print("modules required:")
> > >>>>> +        for m in self.modules_require:
> > >>>>> +            url, version, destdir, fullrev =3D
> self.modules_require[m]
> > >>>>> +            print("%s %s %s %s" % (m, version, url, fullrev))
> > >>>>> +
> > >>>>> +        print("modules replace:")
> > >>>>> +        for m in self.modules_replace:
> > >>>>> +            actual_module, actual_version =3D
> self.modules_replace[m]
> > >>>>> +            print("%s =3D> %s %s" % (m, actual_module,
> actual_version))
> > >>>>> +
> > >>>>> +        print("modules unhandled:")
> > >>>>> +        for m in self.modules_unhandled:
> > >>>>> +            reason =3D self.modules_unhandled[m]
> > >>>>> +            print("%s unhandled: %s" % (m, reason))
> > >>>>> +
> > >>>>> +    def parse(self):
> > >>>>> +        # check if this repo needs autogen
> > >>>>> +        repo_url, repo_dest_dir, repo_fullrev =3D
> self.modules_repoinfo[self.repo.split('://')[1]]
> > >>>>> +        if os.path.isdir(os.path.join(repo_dest_dir, 'vendor')):
> > >>>>> +            logger.info("vendor direcotry has already existed
> for %s, no need to add other repos" % self.repo)
> > >>>>> +            return
> > >>>>> +        go_mod_file =3D os.path.join(repo_dest_dir, 'go.mod')
> > >>>>> +        if not os.path.exists(go_mod_file):
> > >>>>> +            logger.info("go.mod file does not exist for %s, no
> need to add otehr repos" % self.repo)
> > >>>>> +            return
> > >>>>> +        self.parse_go_mod(go_mod_file)
> > >>>>> +        self.show_go_mod_info()
> > >>>>> +
> > >>>>> +    def fetch_and_checkout_repo(self, module_name, repo_url, rev=
,
> default_protocol=3D'https://', checkout=3DFalse, get_subpath=3DTrue):
> > >>>>> +        """
> > >>>>> +        Fetch repo_url to <workdir>/repos/repo_base_name
> > >>>>> +        """
> > >>>>> +        protocol =3D default_protocol
> > >>>>> +        if '://' in repo_url:
> > >>>>> +            repo_url_final =3D repo_url
> > >>>>> +        else:
> > >>>>> +            repo_url_final =3D default_protocol + repo_url
> > >>>>> +        logger.debug("fetch and checkout %s %s" %
> (repo_url_final, rev))
> > >>>>> +        repos_dir =3D os.path.join(self.workdir, 'repos')
> > >>>>> +        if not os.path.exists(repos_dir):
> > >>>>> +            os.makedirs(repos_dir)
> > >>>>> +        repo_basename =3D repo_url.split('/')[-1].split('.git')[=
0]
> > >>>>> +        repo_dest_dir =3D os.path.join(repos_dir, repo_basename)
> > >>>>> +        module_last_name =3D module_name.split('/')[-1]
> > >>>>> +        git_action =3D "fetch"
> > >>>>> +        if os.path.exists(repo_dest_dir):
> > >>>>> +            if checkout:
> > >>>>> +                # check if current HEAD is rev
> > >>>>> +                try:
> > >>>>> +                    headrev =3D subprocess.check_output('git
> rev-list -1 HEAD', shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').str=
ip()
> > >>>>> +                    requiredrev =3D subprocess.check_output('git
> rev-list -1 %s 2>/dev/null || git rev-list -1 %s/%s' % (rev,
> module_last_name, rev), shell=3DTrue,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> > >>>>> +                    if headrev =3D=3D requiredrev:
> > >>>>> +                        logger.info("%s has already been fetched
> and checked out as required, skipping" % repo_url)
> > >>>>> +                        self.modules_repoinfo[module_name] =3D
> (repo_url, repo_dest_dir, requiredrev)
> > >>>>> +                        return
> > >>>>> +                    else:
> > >>>>> +                        logger.info("HEAD of %s is not %s, will
> do a clean clone" % (repo_dest_dir, requiredrev))
> > >>>>> +                        git_action =3D "clone"
> > >>>>> +                except:
> > >>>>> +                    logger.info("'git rev-list' in %s failed,
> will do a clean clone" % repo_dest_dir)
> > >>>>> +                    git_action =3D "clone"
> > >>>>> +            else:
> > >>>>> +                # determine if the current repo points to the
> desired remote repo
> > >>>>> +                try:
> > >>>>> +                    remote_origin_url =3D
> subprocess.check_output('git config --get remote.origin.url', shell=3DTru=
e,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> > >>>>> +                    if remote_origin_url.endswith('.git'):
> > >>>>> +                        if not repo_url_final.endswith('.git'):
> > >>>>> +                            remote_origin_url =3D
> remote_origin_url[:-4]
> > >>>>> +                    else:
> > >>>>> +                        if repo_url_final.endswith('.git'):
> > >>>>> +                            remote_origin_url =3D remote_origin_=
url
> + '.git'
> > >>>>> +                    if remote_origin_url !=3D repo_url_final:
> > >>>>> +                        logger.info("remote.origin.url for %s is
> not %s, will do a clean clone" % (repo_dest_dir, repo_url_final))
> > >>>>> +                        git_action =3D "clone"
> > >>>>> +                except:
> > >>>>> +                    logger.info("'git config --get
> remote.origin.url' in %s failed, will do a clean clone" % repo_dest_dir)
> > >>>>> +                    git_action =3D "clone"
> > >>>>> +        else:
> > >>>>> +            # No local repo, clone it.
> > >>>>> +            git_action =3D "clone"
> > >>>>> +
> > >>>>> +        if git_action =3D=3D "clone":
> > >>>>> +            logger.info("Removing %s" % repo_dest_dir)
> > >>>>> +            subprocess.check_call('rm -rf %s' % repo_dest_dir,
> shell=3DTrue)
> > >>>>> +
> > >>>>> +        # clone/fetch repo
> > >>>>> +        try:
> > >>>>> +            git_cwd =3D repos_dir if git_action =3D=3D "clone" e=
lse
> repo_dest_dir
> > >>>>> +            logger.info("git %s %s in %s" % (git_action,
> repo_url_final, git_cwd))
> > >>>>> +            subprocess.check_call('git %s %s >/dev/null 2>&1' %
> (git_action, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)
> > >>>>> +        except:
> > >>>>> +            logger.warning("Failed to %s %s in %s" % (git_action=
,
> repo_url_final, git_cwd))
> > >>>>> +            return
> > >>>>> +
> > >>>>> +        def get_requiredrev(get_subpath):
> > >>>>> +            import re
> > >>>>> +            # check if rev is a revision or a version
> > >>>>> +            if len(rev) =3D=3D 12 and re.match('[0-9a-f]+', rev)=
:
> > >>>>> +                rev_is_version =3D False
> > >>>>> +            else:
> > >>>>> +                rev_is_version =3D True
> > >>>>> +
> > >>>>> +            # if rev is not a version, 'git rev-list -1 <rev>'
> should just succeed!
> > >>>>> +            if not rev_is_version:
> > >>>>> +                try:
> > >>>>> +                    rev_return =3D subprocess.check_output('git
> rev-list -1 %s 2>/dev/null' % rev, shell=3DTrue,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> > >>>>> +                    if get_subpath:
> > >>>>> +                        cmd =3D 'git branch -M toremove && git
> checkout -b check_subpath %s && git branch -D toremove' % rev_return
> > >>>>> +                        subprocess.check_call(cmd, shell=3DTrue,
> cwd=3Drepo_dest_dir)
> > >>>>> +                        # try to get the subpath for this module
> > >>>>> +                        module_name_parts =3D module_name.split(=
'/')
> > >>>>> +                        while (len(module_name_parts) > 0):
> > >>>>> +                            subpath =3D '/'.join(module_name_par=
ts)
> > >>>>> +                            dir_to_check =3D repo_dest_dir + '/'=
 +
> '/'.join(module_name_parts)
> > >>>>> +                            if os.path.isdir(dir_to_check):
> > >>>>> +
> self.modules_subpaths[module_name] =3D subpath
> > >>>>> +                                break
> > >>>>> +                            else:
> > >>>>> +                                module_name_parts.pop(0)
> > >>>>> +                    return rev_return
> > >>>>> +                except:
> > >>>>> +                    logger.warning("Revision (%s) not in
> repo(%s)" % (rev, repo_dest_dir))
> > >>>>> +                    return None
> > >>>>> +
> > >>>>> +            # the following codes deals with case where rev is a
> version
> > >>>>> +            # determine the longest match tag, in this way, we
> can get the current srcpath to be used in relocation.inc
> > >>>>> +            # we first get the initial tag, which is formed from
> module_name and rev
> > >>>>> +            module_parts =3D module_name.split('/')
> > >>>>> +            if rev.startswith(module_parts[-1] + '.'):
> > >>>>> +                tag =3D '/'.join(module_parts[:-1]) + '/' + rev
> > >>>>> +                last_module_part_replaced =3D True
> > >>>>> +            else:
> > >>>>> +                tag =3D '/'.join(module_parts) + '/' + rev
> > >>>>> +                last_module_part_replaced =3D False
> > >>>>> +            logger.debug("use %s as the initial tag for %s" %
> (tag, module_name))
> > >>>>> +            tag_parts =3D tag.split('/')
> > >>>>> +            while(len(tag_parts) > 0):
> > >>>>> +                try:
> > >>>>> +                    rev_return =3D subprocess.check_output('git
> rev-list -1 %s 2>/dev/null' % tag, shell=3DTrue,
> cwd=3Drepo_dest_dir).decode('utf-8').strip()
> > >>>>> +                    if len(tag_parts) > 1:
> > >>>>> +                        # ensure that the subpath exists
> > >>>>> +                        if get_subpath:
> > >>>>> +                            cmd =3D 'git branch -M toremove && g=
it
> checkout -b check_subpath %s && git branch -D toremove' % rev_return
> > >>>>> +                            subprocess.check_call(cmd,
> shell=3DTrue, cwd=3Drepo_dest_dir)
> > >>>>> +                            # get subpath for the
> actual_module_name
> > >>>>> +                            if last_module_part_replaced:
> > >>>>> +                                subpath =3D
> '/'.join(tag_parts[:-1]) + '/' + module_parts[-1]
> > >>>>> +                                if not
> os.path.isdir(repo_dest_dir + '/' + subpath):
> > >>>>> +                                    subpath =3D
> '/'.join(tag_parts[:-1])
> > >>>>> +                            else:
> > >>>>> +                                subpath =3D '/'.join(tag_parts[:=
-1])
> > >>>>> +                            if not os.path.isdir(repo_dest_dir +
> '/' + subpath):
> > >>>>> +                                logger.warning("subpath (%s)
> derived from tag matching does not exist in %s" % (subpath, repo_dest_dir=
))
> > >>>>> +                                return None
> > >>>>> +                            self.modules_subpaths[module_name] =
=3D
> subpath
> > >>>>> +                            logger.info("modules_subpath[%s] =3D
> %s" % (module_name, subpath))
> > >>>>> +                    return rev_return
> > >>>>> +                except:
> > >>>>> +                    tag_parts.pop(0)
> > >>>>> +                    tag =3D '/'.join(tag_parts)
> > >>>>> +            logger.warning("No tag matching %s" % rev)
> > >>>>> +            return None
> > >>>>> +
> > >>>>> +        requiredrev =3D get_requiredrev(get_subpath)
> > >>>>> +        if requiredrev:
> > >>>>> +            logger.info("Got module(%s) requiredrev: %s" %
> (module_name, requiredrev))
> > >>>>> +            if checkout:
> > >>>>> +                subprocess.check_call('git checkout -b
> gomodautogen %s' % requiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)
> > >>>>> +            self.modules_repoinfo[module_name] =3D (repo_url,
> repo_dest_dir, requiredrev)
> > >>>>> +        else:
> > >>>>> +            logger.warning("Failed to get requiredrev, repo_url =
=3D
> %s, rev =3D %s, module_name =3D %s" % (repo_url, rev, module_name))
> > >>>>> +
> > >>>>> +    def parse_go_mod(self, go_mod_path):
> > >>>>> +        """
> > >>>>> +        Parse go.mod file to get the modules info
> > >>>>> +        """
> > >>>>> +        # First we get the require and replace lines
> > >>>>> +        # The parsing logic assumes the replace lines come
> *after* the require lines
> > >>>>> +        inrequire =3D False
> > >>>>> +        inreplace =3D False
> > >>>>> +        with open(go_mod_path, 'r') as f:
> > >>>>> +            lines =3D f.readlines()
> > >>>>> +            for line in lines:
> > >>>>> +                if line.startswith('require ('):
> > >>>>> +                    inrequire =3D True
> > >>>>> +                    continue
> > >>>>> +                if line.startswith(')'):
> > >>>>> +                    inrequire =3D False
> > >>>>> +                    continue
> > >>>>> +                if line.startswith('require ') or inrequire:
> > >>>>> +                    # we have one line require
> > >>>>> +                    require_line =3D line.lstrip('require
> ').split('//')[0].strip()
> > >>>>> +                    if require_line:
> > >>>>> +                        self.require_lines.append(require_line)
> > >>>>> +                    continue
> > >>>>> +                # we can deal with requires and replaces
> separately because go.mod always writes requires before replaces
> > >>>>> +                if line.startswith('replace ('):
> > >>>>> +                    inreplace =3D True
> > >>>>> +                    continue
> > >>>>> +                if line.startswith(')'):
> > >>>>> +                    inreplace =3D False
> > >>>>> +                    continue
> > >>>>> +                if line.startswith('replace ') or inreplace:
> > >>>>> +                    replace_line =3D line.lstrip('replace
> ').split('//')[0].strip()
> > >>>>> +                    if replace_line:
> > >>>>> +                        self.replace_lines.append(replace_line)
> > >>>>> +                    continue
> > >>>>> +        #
> > >>>>> +        # parse the require_lines and replace_lines to form
> self.modules_require and self.modules_replace
> > >>>>> +        #
> > >>>>> +        logger.debug("Parsing require_lines and replace_lines
> ...")
> > >>>>> +        # A typical replace line is as below:
> > >>>>> +        #   github.com/hashicorp/golang-lru =3D>
> github.com/ktock/golang-lru v0.5.5-0.20211029085301-ec551be6f75c
> > >>>>> +        # It means that the github.com/hashicorp/golang-lru
> module is replaced by github.com/ktock/golang-lru
> > >>>>> +        # with the version 'v0.5.5-0.20211029085301-ec551be6f75c=
'.
> > >>>>> +        # So the destdir is vendor/
> github.com/hashicorp/golang-lru while the contents are from
> github.com/ktock/golang-lru
> > >>>>> +        for line in self.replace_lines:
> > >>>>> +            orig_module, actual =3D line.split('=3D>')
> > >>>>> +            actual_module, actual_version =3D actual.split()
> > >>>>> +            orig_module =3D orig_module.strip()
> > >>>>> +            actual_module =3D actual_module.strip()
> > >>>>> +            actual_version =3D actual_version.strip()
> > >>>>> +            self.modules_replace[orig_module] =3D (actual_module=
,
> actual_version)
> > >>>>> +        #
> > >>>>> +        # Typical require lines are as below:
> > >>>>> +        #   github.com/Masterminds/semver/v3 v3.1.1
> > >>>>> +        #   golang.org/x/crypto
> v0.0.0-20220321153916-2c7772ba3064
> > >>>>> +        #
> > >>>>> +        # We need to first try https://<module_name>?=3Dgo-get=
=3D1
> to see it contains
> > >>>>> +        # line starting with '<meta name=3D"go-import" content=
=3D'.
> > >>>>> +        #
> > >>>>> +        # If so, get root-path vcs repo-url from content. See
> https://go.dev/ref/mod#vcs-find
> > >>>>> +        # For example, the above 'wget
> https://golang.org/x/crypto?go-get=3D1' gives you
> > >>>>> +        # <meta name=3D"go-import" content=3D"golang.org/x/crypt=
o
> git https://go.googlesource.com/crypto">
> > >>>>> +        # In such case, the self.modules_require has the
> following contents:
> > >>>>> +        # module_name: golang.org/x/crypto
> > >>>>> +        # url: https://go.googlesource.com/crypto
> > >>>>> +        # version: v0.0.0-20220321153916-2c7772ba3064
> > >>>>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/
> golang.org/x/crypto
> > >>>>> +        # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d
> (git rev-list -1 2c7772ba3064)
> > >>>>> +        #
> > >>>>> +        # If not, try https://pkg.go.dev/<module_name>, and find
> the 'Repository'.
> > >>>>> +        # For example, 'wget
> https://pkg.go.dev/github.com/Masterminds/semver/v3' gives:
> > >>>>> +        # github.com/Masterminds/semver
> > >>>>> +        # In such case, the self.modules has the following
> contents:
> > >>>>> +        # module_name: github.com/Masterminds/semver/v3
> > >>>>> +        # url: https://github.com/Masterminds/semver
> > >>>>> +        # version: v3.1.1
> > >>>>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/
> github.com/Masterminds/semver/v3
> > >>>>> +        # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e
> (git rev-list -1 v3.1.1)
> > >>>>> +        #
> > >>>>> +        # As a last resort, if the last component of
> <module_name> matches 'v[0-9]+',
> > >>>>> +        # remove the last component and try wget https://
> <module_name_with_last_component_removed>?go-get=3D1,
> > >>>>> +        # then try using the above matching method.
> > >>>>> +        #
> > >>>>> +        for line in self.require_lines:
> > >>>>> +            module_name, version =3D line.strip().split()
> > >>>>> +            logger.debug("require line: %s" % line)
> > >>>>> +            logger.debug("module_name =3D %s; version =3D %s" %
> (module_name, version))
> > >>>>> +            # take the modules_replace into consideration to get
> the actual version and actual module name
> > >>>>> +            # note that the module_name is used in destdir, and
> the actual_module_name and actual_version
> > >>>>> +            # are used to determine the url and fullsrcrev
> > >>>>> +            destdir =3D
> '${WORKDIR}/${BP}/src/import/vendor.fetch/%s' % module_name
> > >>>>> +            actual_module_name =3D module_name
> > >>>>> +            actual_version =3D version
> > >>>>> +            if module_name in self.modules_replace:
> > >>>>> +                actual_module_name, actual_version =3D
> self.modules_replace[module_name]
> > >>>>> +            logger.debug("actual_module_name =3D %s; actual_vers=
ion
> =3D %s" % (actual_module_name, actual_version))
> > >>>>> +            url, fullsrcrev =3D
> self.get_url_srcrev(actual_module_name, actual_version)
> > >>>>> +            logger.debug("url =3D %s; fullsrcrev =3D %s" % (url,
> fullsrcrev))
> > >>>>> +            if url and fullsrcrev:
> > >>>>> +                self.modules_require[module_name] =3D (url,
> version, destdir, fullsrcrev)
> > >>>>> +                # form srcpath, actual_module_name/<subpath>
> > >>>>> +                if actual_module_name in self.modules_subpaths:
> > >>>>> +                    subpath =3D
> self.modules_subpaths[actual_module_name]
> > >>>>> +                    srcpath =3D '%s/%s' % (actual_module_name,
> subpath)
> > >>>>> +                    self.modules_srcpaths[module_name] =3D srcpa=
th
> > >>>>> +                    logger.info("self.modules_srcpaths[%s] =3D %=
s"
> % (module_name, srcpath))
> > >>>>> +                else:
> > >>>>> +                    self.modules_srcpaths[module_name] =3D
> actual_module_name
> > >>>>> +            else:
> > >>>>> +                logger.warning("get_url_srcrev(%s, %s) failed" %
> (actual_module_name, actual_version))
> > >>>>> +                if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:
> > >>>>> +                    sys.exit(1)
> > >>>>> +
> > >>>>> +    def use_wget_to_get_repo_url(self, wget_content_file,
> url_cache_file, module_name):
> > >>>>> +        """
> > >>>>> +        Use wget to get repo_url for module_name, return None if
> not found
> > >>>>> +        """
> > >>>>> +        try:
> > >>>>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1" %
> (wget_content_file, module_name))
> > >>>>> +            subprocess.check_call('wget -O %s https://%s?=3Dgo-g=
et=3D1'
> % (wget_content_file, module_name), shell=3DTrue)
> > >>>>> +            with open(wget_content_file, 'r') as f:
> > >>>>> +                for line in f.readlines():
> > >>>>> +                    if '<meta name=3D"go-import" content=3D' in =
line:
> > >>>>> +                        logger.info("Succeed to find go-import
> content for %s" % module_name)
> > >>>>> +                        logger.debug("The line is %s" % line)
> > >>>>> +                        root_path, vcs, repo_url =3D
> line.split('content=3D')[1].split('"')[1].split()
> > >>>>> +                        logger.info("%s: %s %s %s" %
> (module_name, root_path, vcs, repo_url))
> > >>>>> +                        if vcs !=3D 'git':
> > >>>>> +                            logger.warning('%s unhandled as its
> vcs is %s which is not supported by this script.' % (module_name, vcs))
> > >>>>> +                            unhandled_reason =3D 'vcs %s is not
> supported by this script' % vcs
> > >>>>> +                            self.modules_unhandled[module_name] =
=3D
> unhandled_reason
> > >>>>> +                            return None
> > >>>>> +                        with open(url_cache_file, 'w') as f:
> > >>>>> +                            f.write(repo_url)
> > >>>>> +                        return repo_url
> > >>>>> +        except:
> > >>>>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1 fai=
led"
> % (wget_content_file, module_name))
> > >>>>> +        # if we cannot find repo url from https://<module_name>?=
=3Dgo-get=3D1,
> try https://pkg.go/dev/<module_name>
> > >>>>> +        try:
> > >>>>> +            logger.info("wget -O %s https://pkg.go.dev/%s" %
> (wget_content_file, module_name))
> > >>>>> +            subprocess.check_call("wget -O %s
> https://pkg.go.dev/%s" % (wget_content_file, module_name), shell=3DTrue)
> > >>>>> +            repo_url_found =3D False
> > >>>>> +            with open(wget_content_file, 'r') as f:
> > >>>>> +                in_repo_section =3D False
> > >>>>> +                for line in f.readlines():
> > >>>>> +                    if '>Repository<' in line:
> > >>>>> +                        in_repo_section =3D True
> > >>>>> +                        continue
> > >>>>> +                    if in_repo_section:
> > >>>>> +                        newline =3D line.strip()
> > >>>>> +                        if newline !=3D '' and not
> newline.startswith('<'):
> > >>>>> +                            repo_url =3D newline
> > >>>>> +                            repo_url_found =3D True
> > >>>>> +                            break
> > >>>>> +            if repo_url_found:
> > >>>>> +                logger.info("repo url for %s: %s" %
> (module_name, repo_url))
> > >>>>> +                with open(url_cache_file, 'w') as f:
> > >>>>> +                    f.write(repo_url)
> > >>>>> +                return repo_url
> > >>>>> +            else:
> > >>>>> +                unhandled_reason =3D 'cannot determine repo_url =
for
> %s' % module_name
> > >>>>> +                self.modules_unhandled[module_name] =3D
> unhandled_reason
> > >>>>> +                return None
> > >>>>> +        except:
> > >>>>> +            logger.info("wget -O %s https://pkg.go.dev/%s
> failed" % (wget_content_file, module_name))
> > >>>>> +            return None
> > >>>>> +
> > >>>>> +
> > >>>>> +    def get_repo_url_rev(self, module_name, version):
> > >>>>> +        """
> > >>>>> +        Return (repo_url, rev)
> > >>>>> +        """
> > >>>>> +        import re
> > >>>>> +        # First get rev from version
> > >>>>> +        v =3D version.split('+incompatible')[0]
> > >>>>> +        version_components =3D v.split('-')
> > >>>>> +        if len(version_components) =3D=3D 1:
> > >>>>> +            rev =3D v
> > >>>>> +        elif len(version_components) =3D=3D 3:
> > >>>>> +            if len(version_components[2]) =3D=3D 12:
> > >>>>> +                rev =3D version_components[2]
> > >>>>> +            else:
> > >>>>> +                rev =3D v
> > >>>>> +        else:
> > >>>>> +            rev =3D v
> > >>>>> +
> > >>>>> +        #
> > >>>>> +        # Get repo_url
> > >>>>> +        # We put a cache mechanism here,
> <wget_content_file>.repo_url.cache is used to store the repo url fetch
> before
> > >>>>> +        #
> > >>>>> +        wget_dir =3D os.path.join(self.workdir, 'wget-contents')
> > >>>>> +        if not os.path.exists(wget_dir):
> > >>>>> +            os.makedirs(wget_dir)
> > >>>>> +        wget_content_file =3D os.path.join(wget_dir,
> module_name.replace('/', '_'))
> > >>>>> +        url_cache_file =3D "%s.repo_url.cache" % wget_content_fi=
le
> > >>>>> +        if os.path.exists(url_cache_file):
> > >>>>> +            with open(url_cache_file, 'r') as f:
> > >>>>> +                repo_url =3D f.readline().strip()
> > >>>>> +                return (repo_url, rev)
> > >>>>> +        module_name_parts =3D module_name.split('/')
> > >>>>> +        while (len(module_name_parts) > 0):
> > >>>>> +            module_name_to_check =3D '/'.join(module_name_parts)
> > >>>>> +            logger.info("module_name_to_check: %s" %
> module_name_to_check)
> > >>>>> +            repo_url =3D
> self.use_wget_to_get_repo_url(wget_content_file, url_cache_file,
> module_name_to_check)
> > >>>>> +            if repo_url:
> > >>>>> +                return (repo_url, rev)
> > >>>>> +            else:
> > >>>>> +                if module_name in self.modules_unhandled:
> > >>>>> +                    return (None, rev)
> > >>>>> +                else:
> > >>>>> +                    module_name_parts.pop(-1)
> > >>>>> +
> > >>>>> +        unhandled_reason =3D 'cannot determine the repo for %s' =
%
> module_name
> > >>>>> +        self.modules_unhandled[module_name] =3D unhandled_reason
> > >>>>> +        return (None, rev)
> > >>>>> +
> > >>>>> +    def get_url_srcrev(self, module_name, version):
> > >>>>> +        """
> > >>>>> +        Return url and fullsrcrev according to module_name and
> version
> > >>>>> +        """
> > >>>>> +        repo_url, rev =3D self.get_repo_url_rev(module_name,
> version)
> > >>>>> +        if not repo_url or not rev:
> > >>>>> +            return (None, None)
> > >>>>> +        self.fetch_and_checkout_repo(module_name, repo_url, rev)
> > >>>>> +        if module_name in self.modules_repoinfo:
> > >>>>> +            repo_url, repo_dest_dir, repo_fullrev =3D
> self.modules_repoinfo[module_name]
> > >>>>> +            # remove the .git suffix to sync repos across module=
s
> with different versions and across recipes
> > >>>>> +            if repo_url.endswith('.git'):
> > >>>>> +                repo_url =3D repo_url[:-len('.git')]
> > >>>>> +            return (repo_url, repo_fullrev)
> > >>>>> +        else:
> > >>>>> +            unhandled_reason =3D 'fetch_and_checkout_repo(%s, %s=
,
> %s) failed' % (module_name, repo_url, rev)
> > >>>>> +            self.modules_unhandled[module_name] =3D unhandled_re=
ason
> > >>>>> +            return (None, None)
> > >>>>> +
> > >>>>> +    def gen_src_uri_inc(self):
> > >>>>> +        """
> > >>>>> +        Generate src_uri.inc file containing SRC_URIs
> > >>>>> +        """
> > >>>>> +        src_uri_inc_file =3D os.path.join(self.workdir,
> 'src_uri.inc')
> > >>>>> +        # record the <name> after writting SRCREV_<name>, this i=
s
> to avoid modules having the same basename resulting in same SRCREV_xxx
> > >>>>> +        srcrev_name_recorded =3D []
> > >>>>> +        template =3D """#       %s %s
> > >>>>> +# [1] git ls-remote %s %s
> > >>>>> +SRCREV_%s=3D"%s"
> > >>>>> +SRC_URI +=3D
> "git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}=
/${BP}/src/import/vendor.fetch/%s"
> > >>>>> +
> > >>>>> +"""
> > >>>>> +        # We can't simply write SRC_URIs one by one in the order
> that go.mod specify them.
> > >>>>> +        # Because the latter one might clean things up for the
> former one if the former one is a subpath of the latter one.
> > >>>>> +        def take_first_len(elem):
> > >>>>> +            return len(elem[0])
> > >>>>> +
> > >>>>> +        src_uri_contents =3D []
> > >>>>> +        with open(src_uri_inc_file, 'w') as f:
> > >>>>> +            for module in self.modules_require:
> > >>>>> +                # {module_name: (url, version, destdir,
> fullsrcrev)}
> > >>>>> +                repo_url, version, destdir, fullrev =3D
> self.modules_require[module]
> > >>>>> +                if module in self.modules_replace:
> > >>>>> +                    actual_module_name, actual_version =3D
> self.modules_replace[module]
> > >>>>> +                else:
> > >>>>> +                    actual_module_name, actual_version =3D (modu=
le,
> version)
> > >>>>> +                if '://' in repo_url:
> > >>>>> +                    repo_url_noprotocol =3D repo_url.split('://'=
)[1]
> > >>>>> +                else:
> > >>>>> +                    repo_url_noprotocol =3D repo_url
> > >>>>> +                if not repo_url.startswith('https://'):
> > >>>>> +                    repo_url =3D 'https://' + repo_url
> > >>>>> +                name =3D module.split('/')[-1]
> > >>>>> +                if name in srcrev_name_recorded:
> > >>>>> +                    name =3D '-'.join(module.split('/')[-2:])
> > >>>>> +                src_uri_contents.append((actual_module_name,
> actual_version, repo_url, fullrev, name, fullrev, repo_url_noprotocol,
> name, actual_module_name))
> > >>>>> +                srcrev_name_recorded.append(name)
> > >>>>> +            # sort the src_uri_contents and then write it
> > >>>>> +            src_uri_contents.sort(key=3Dtake_first_len)
> > >>>>> +            for content in src_uri_contents:
> > >>>>> +                f.write(template % content)
> > >>>>> +        logger.info("%s generated" % src_uri_inc_file)
> > >>>>> +
> > >>>>> +    def gen_relocation_inc(self):
> > >>>>> +        """
> > >>>>> +        Generate relocation.inc file
> > >>>>> +        """
> > >>>>> +        relocation_inc_file =3D os.path.join(self.workdir,
> 'relocation.inc')
> > >>>>> +        template =3D """export sites=3D"%s"
> > >>>>> +
> > >>>>> +do_compile:prepend() {
> > >>>>> +    cd ${S}/src/import
> > >>>>> +    for s in $sites; do
> > >>>>> +        site_dest=3D$(echo $s | cut -d: -f1)
> > >>>>> +        site_source=3D$(echo $s | cut -d: -f2)
> > >>>>> +        force_flag=3D$(echo $s | cut -d: -f3)
> > >>>>> +        mkdir -p vendor.copy/$site_dest
> > >>>>> +        if [ -n "$force_flag" ]; then
> > >>>>> +           echo "[INFO] $site_dest: force copying .go files"
> > >>>>> +           rm -rf vendor.copy/$site_dest
> > >>>>> +           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest
> > >>>>> +        else
> > >>>>> +            [ -n "$(ls -A vendor.copy/$site_dest/*.go 2>
> /dev/null)" ] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: =
go
> copy skipped (files present)" ; true ; } || { echo "[INFO] $site_dest:
> copying .go files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
> > >>>>> +        fi
> > >>>>> +    done
> > >>>>> +}
> > >>>>> +"""
> > >>>>> +        sites =3D []
> > >>>>> +        for module in self.modules_require:
> > >>>>> +            # <dest>:<source>[:force]
> > >>>>> +            if module in self.modules_srcpaths:
> > >>>>> +                srcpath =3D self.modules_srcpaths[module]
> > >>>>> +                logger.debug("Using %s as srcpath of module (%s)=
"
> % (srcpath, module))
> > >>>>> +            else:
> > >>>>> +                srcpath =3D module
> > >>>>> +            sites.append("%s:%s:force" % (module, srcpath))
> > >>>>> +        # To avoid the former one being overriden by the latter
> one when the former one is a subpath of the latter one, sort sites
> > >>>>> +        sites.sort(key=3Dlen)
> > >>>>> +        with open(relocation_inc_file, 'w') as f:
> > >>>>> +            sites_str =3D ' \\\n           '.join(sites)
> > >>>>> +            f.write(template % sites_str)
> > >>>>> +        logger.info("%s generated" % relocation_inc_file)
> > >>>>> +
> > >>>>> +    def gen_modules_txt(self):
> > >>>>> +        """
> > >>>>> +        Generate modules.txt file
> > >>>>> +        """
> > >>>>> +        modules_txt_file =3D os.path.join(self.workdir,
> 'modules.txt')
> > >>>>> +        with open(modules_txt_file, 'w') as f:
> > >>>>> +            for l in self.require_lines:
> > >>>>> +                f.write('# %s\n' % l)
> > >>>>> +                f.write('## explicit\n')
> > >>>>> +            for l in self.replace_lines:
> > >>>>> +                f.write('# %s\n' %l)
> > >>>>> +        logger.info("%s generated" % modules_txt_file)
> > >>>>> +
> > >>>>> +    def sanity_check(self):
> > >>>>> +        """
> > >>>>> +        Various anity checks
> > >>>>> +        """
> > >>>>> +        sanity_check_ok =3D True
> > >>>>> +        #
> > >>>>> +        # Sanity Check 1:
> > >>>>> +        #     For modules having the same repo, at most one is
> allowed to not have subpath.
> > >>>>> +        #     This check operates on self.modules_repoinfo and
> self.modules_subpaths
> > >>>>> +        #
> > >>>>> +        repo_modules =3D {}
> > >>>>> +        for module in self.modules_repoinfo:
> > >>>>> +            # first form {repo: [module1, module2, ...]}
> > >>>>> +            repo_url, repo_dest_dir, fullsrcrev =3D
> self.modules_repoinfo[module]
> > >>>>> +            if repo_url not in repo_modules:
> > >>>>> +                repo_modules[repo_url] =3D [module]
> > >>>>> +            else:
> > >>>>> +                repo_modules[repo_url].append(module)
> > >>>>> +        for repo in repo_modules:
> > >>>>> +            modules =3D repo_modules[repo]
> > >>>>> +            if len(modules) =3D=3D 1:
> > >>>>> +                continue
> > >>>>> +            # for modules sharing the same repo, at most one is
> allowed to not have subpath
> > >>>>> +            nosubpath_modules =3D []
> > >>>>> +            for m in modules:
> > >>>>> +                if m not in self.modules_subpaths:
> > >>>>> +                    nosubpath_modules.append(m)
> > >>>>> +            if len(nosubpath_modules) =3D=3D 0:
> > >>>>> +                continue
> > >>>>> +            if len(nosubpath_modules) > 1:
> > >>>>> +                logger.warning("Multiple modules sharing %s, but
> they don't have subpath: %s. Please double check." % (repo,
> nosubpath_modules))
> > >>>>> +            if len(nosubpath_modules) =3D=3D 1:
> > >>>>> +                # do further check, OK if the module is the
> prefix for other modules sharing the same repo
> > >>>>> +                module_to_check =3D nosubpath_modules[0]
> > >>>>> +                for m in modules:
> > >>>>> +                    if module_to_check =3D=3D m:
> > >>>>> +                        continue
> > >>>>> +                    if not m.startswith('%s/' % module_to_check)=
:
> > >>>>> +                        logger.warning("%s is sharing repo (%s)
> with other modules, and it might need a subpath. Please double check" %
> (module_to_check, repo))
> > >>>>> +                        continue
> > >>>>> +
> > >>>>> +        #
> > >>>>> +        # End of Sanity Check
> > >>>>> +        #
> > >>>>> +        if not sanity_check_ok:
> > >>>>> +            sys.exit(1)
> > >>>>> +        return
> > >>>>> +
> > >>>>> +def main():
> > >>>>> +    parser =3D argparse.ArgumentParser(
> > >>>>> +        description=3D"oe-go-mod-autogen.py is used to generate
> src_uri.inc, relocation.inc and modules.txt to be used by go mod recipes"=
,
> > >>>>> +        epilog=3D"Use %(prog)s --help to get help")
> > >>>>> +    parser.add_argument("--repo", help =3D "Repo for the recipe.=
",
> required=3DTrue)
> > >>>>> +    parser.add_argument("--rev", help =3D "Revision for the
> recipe.", required=3DTrue)
> > >>>>> +    parser.add_argument("--module", help =3D "Go module name. To=
 be
> used with '--test'")
> > >>>>> +    parser.add_argument("--version", help =3D "Go module version=
.
> To be used with '--test'")
> > >>>>> +    parser.add_argument("--test", help =3D "Test to get repo url
> and fullsrcrev, used together with --module and --version.",
> action=3D"store_true")
> > >>>>> +    parser.add_argument("--workdir", help =3D "Working directory=
 to
> hold intermediate results and output.", default=3Dos.getcwd())
> > >>>>> +    parser.add_argument("-d", "--debug",
> > >>>>> +                        help =3D "Enable debug output",
> > >>>>> +                        action=3D"store_const",
> const=3Dlogging.DEBUG, dest=3D"loglevel", default=3Dlogging.INFO)
> > >>>>> +    parser.add_argument("-q", "--quiet",
> > >>>>> +                        help =3D "Hide all output except error
> messages",
> > >>>>> +                        action=3D"store_const",
> const=3Dlogging.ERROR, dest=3D"loglevel")
> > >>>>> +    args =3D parser.parse_args()
> > >>>>> +
> > >>>>> +    logger.setLevel(args.loglevel)
> > >>>>> +    logger.debug("oe-go-mod-autogen.py running for %s:%s in %s" =
%
> (args.repo, args.rev, args.workdir))
> > >>>>> +    gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)
> > >>>>> +    if args.test:
> > >>>>> +        if not args.module or not args.version:
> > >>>>> +            print("Please specify --module and --version")
> > >>>>> +            sys.exit(1)
> > >>>>> +        url, srcrev =3D gomodtool.get_url_srcrev(args.module,
> args.version)
> > >>>>> +        print("url =3D %s, srcrev =3D %s" % (url, srcrev))
> > >>>>> +        if not url or not srcrev:
> > >>>>> +            print("Failed to get url & srcrev for %s:%s" %
> (args.module, args.version))
> > >>>>> +    else:
> > >>>>> +        gomodtool.parse()
> > >>>>> +        gomodtool.sanity_check()
> > >>>>> +        gomodtool.gen_src_uri_inc()
> > >>>>> +        gomodtool.gen_relocation_inc()
> > >>>>> +        gomodtool.gen_modules_txt()
> > >>>>> +
> > >>>>> +
> > >>>>> +if __name__ =3D=3D "__main__":
> > >>>>> +    try:
> > >>>>> +        ret =3D main()
> > >>>>> +    except Exception as esc:
> > >>>>> +        ret =3D 1
> > >>>>> +        import traceback
> > >>>>> +        traceback.print_exc()
> > >>>>> +    sys.exit(ret)
> > >>>>> --
> > >>>>> 2.40.0
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>>
> > >>
> > >> --
> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > >> thee at its end
> > >> - "Use the force Harry" - Gandalf, Star Trek II
> > >>
> > >>
> > >>
> > >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8288):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8288
> Mute This Topic: https://lists.yoctoproject.org/mt/101162746/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/11553848/50526=
12/94736074/xyzzy
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001d8e07060512dbbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
sexta, 8/09/2023 =C3=A0(s) 21:05:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Indeed.<br>
<br>
I&#39;ve worked around the issues, and have ported a few of my changes to<b=
r>
your script to make it work similarly to mine in my update environment.<br>
<br>
I have more changes to port, but this is enough for now.<br>
<br>
You&#39;ll see my documentation and --help updates on master-next.<br>
<br>
Bruce<br></blockquote><div><br></div><div>Thanks=C2=A0for creating the read=
me.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
<br>
On Thu, Sep 7, 2023 at 10:31=E2=80=AFPM ChenQi &lt;<a href=3D"mailto:Qi.Che=
n@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 9/8/23 05:09, Bruce Ashfield wrote:<br>
&gt; &gt; On Tue, Sep 5, 2023 at 10:49=E2=80=AFPM Bruce Ashfield via<br>
&gt; &gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.yoctoproject.org</a><br>
&gt; &gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproje=
ct.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r>
&gt; &gt;&gt; On Tue, Sep 5, 2023 at 10:41=E2=80=AFPM ChenQi &lt;<a href=3D=
"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&=
gt; wrote:<br>
&gt; &gt;&gt;&gt; On 9/5/23 20:26, Bruce Ashfield wrote:<br>
&gt; &gt;&gt;&gt;&gt; On Mon, Sep 4, 2023 at 11:22=E2=80=AFPM Chen Qi via <=
a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.yoctoproject.org</a><br>
&gt; &gt;&gt;&gt;&gt; &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.y=
octoproject.org" target=3D"_blank">windriver.com@lists.yoctoproject.org</a>=
&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; oe-go-mod-autogen.py is a helper script for go mo=
d recipes. It follows<br>
&gt; &gt;&gt;&gt;&gt;&gt; Bruce&#39;s initiative about how to deal with go =
mod recipes in OE.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I thought the techniques looked familiar!<br>
&gt; &gt;&gt;&gt; Yes, indeed!<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; With golang&#39;s current scheme, your approach is the on=
ly way to 1) make<br>
&gt; &gt;&gt;&gt; these non-vendored go recipes build without network conne=
ction at<br>
&gt; &gt;&gt;&gt; do_compile and 2) conform to OE&#39;s download mirroring =
mechanism. This<br>
&gt; &gt;&gt;&gt; really helps a lot!<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I was just working on my script before my holidays as=
 my uprev cycle had<br>
&gt; &gt;&gt;&gt;&gt; taken me to the non-vendored go recipes and I was run=
ning into a few<br>
&gt; &gt;&gt;&gt;&gt; corner cases.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I&#39;ve got a K3S upgrade already done locally with =
my tweaked script, but<br>
&gt; &gt;&gt;&gt;&gt; I&#39;ll take this for a test run and see if I get th=
e same results with this.<br>
&gt; &gt;&gt;&gt; I did use this script to upgrade k3s to &#39;v1.27.4+k3s1=
&#39;, only for the<br>
&gt; &gt;&gt;&gt; purpose of verifying this script. Those three files were =
correctly<br>
&gt; &gt;&gt;&gt; generated and the build succeeded. Hope you&#39;ll get th=
e same result.<br>
&gt; &gt;&gt; I&#39;m testing the k3s update now, and there are some differ=
ences, but<br>
&gt; &gt;&gt; they are minor and the vendoring looks good.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;ll follow up once I&#39;ve done a bit more testing.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I can take care of a draft README for the script, and I will =
likely<br>
&gt; &gt;&gt; bring over a few of the elements of my script (the ability to=
 do some<br>
&gt; &gt;&gt; module substitutions on the command line), but otherwise, I d=
on&#39;t<br>
&gt; &gt;&gt; see a lot of gaps .<br>
&gt; &gt; I&#39;ve started on a README describing how to run the tool, and =
have<br>
&gt; &gt; spent quite a bit of time with the script now (I was using more<b=
r>
&gt; &gt; heuristics to find the source repository, but using the go VCS<br=
>
&gt; &gt; information makes things work much simpler .. which is of course<=
br>
&gt; &gt; what you are doing).<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve also ported some of my changes over (flags, and the abil=
ity<br>
&gt; &gt; to track a branch (which I now realize I probably don&#39;t reall=
y need).<br>
&gt; &gt;<br>
&gt; &gt; That being said, k3s is now failing during processing:<br>
&gt; &gt;<br>
&gt; &gt; WARNING: Revision (ec00e662324e) not in<br>
&gt; &gt; repo(/opt/bruce/poky/meta-virtualization/repos/nats.go)<br>
&gt; &gt; WARNING: Failed to get requiredrev, repo_url =3D<br>
&gt; &gt; <a href=3D"https://github.com/nats-io/nats.go.git" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/nats-io/nats.go.git</a>, rev =3D =
ec00e662324e,<br>
&gt; &gt; module_name =3D <a href=3D"http://github.com/nats-io/nats.go" rel=
=3D"noreferrer" target=3D"_blank">github.com/nats-io/nats.go</a><br>
&gt; &gt; WARNING: get_url_srcrev(<a href=3D"http://github.com/nats-io/nats=
.go" rel=3D"noreferrer" target=3D"_blank">github.com/nats-io/nats.go</a>,<b=
r>
&gt; &gt; v1.27.1-0.20230619112143-ec00e662324e) failed<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m looking into that issue now.<br>
&gt; &gt;<br>
&gt; &gt; I had a more complicated semver regex to pull out the revisions, =
but in this<br>
&gt; &gt; case, it does appear to be looking for the correct revision in th=
e repository.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m out of time for it today, but will continue working with =
it tomorrow.<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; Yes, I just double checked the <a href=3D"https://github.com/nats-io/n=
ats.go" rel=3D"noreferrer" target=3D"_blank">https://github.com/nats-io/nat=
s.go</a> repo,<br>
&gt; the resivion &#39;ec00e662324e&#39; does not exist.<br>
&gt;<br>
&gt; In k3s master branch, there&#39;s a commit to bump its version.<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/nats-io/nats.=
go" rel=3D"noreferrer" target=3D"_blank">github.com/nats-io/nats.go</a> v1.=
27.1-0.20230619112143-ec00e662324e<br>
&gt; // indirect<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/nats-io/nats.=
go" rel=3D"noreferrer" target=3D"_blank">github.com/nats-io/nats.go</a> v1.=
27.1 // indirect<br>
&gt;<br>
&gt; But for v1.27.5+k3s1, the go.mod file is using &#39;ec00e662324e&#39;.=
<br>
&gt;<br>
&gt; I&#39;ve filed an issue for k3s: <a href=3D"https://github.com/k3s-io/=
k3s/issues/8320" rel=3D"noreferrer" target=3D"_blank">https://github.com/k3=
s-io/k3s/issues/8320</a>.<br>
&gt; Let&#39;s see how k3s community responds to this.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Qi<br>
&gt;<br>
&gt;<br>
&gt; &gt;&gt; (I was doing things like generating the relocation and src_ur=
i<br>
&gt; &gt;&gt; information in one run, and the modules.txt in another, but t=
hese<br>
&gt; &gt;&gt; aren&#39;t important features, so I&#39;ll won&#39;t worry ab=
out them<br>
&gt; &gt;&gt; when consolidating the tools).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Regards,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Qi<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I just didn&#39;t have the time to clean mine up to m=
ake it presentable, so<br>
&gt; &gt;&gt;&gt;&gt; I&#39;m hopeful that this will work and I can take th=
at off my TODO list!<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Bruce<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Example:<br>
&gt; &gt;&gt;&gt;&gt;&gt; cmd: &lt;path_to&gt;/meta-virtualization/scripts/=
oe-go-mod-autogen.py \<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 --repo <a href=3D"http=
s://github.com/docker/compose" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/docker/compose</a> --rev v2.20.3<br>
&gt; &gt;&gt;&gt;&gt;&gt; output: src_uri.inc, relocation.inc, modules.txt<=
br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Copy these three generated files to replace the o=
riginal ones,<br>
&gt; &gt;&gt;&gt;&gt;&gt; then we only need update PV and SRCREV, and docke=
r-compose is upgraded.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Below are some technical details.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; * get module&#39;s repo from module name<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0This script checks the followi=
ng two URLs to determine the module&#39;s repo.<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A01. https://&lt;module_name_twe=
aked&gt;?=3Dgo-get=3D1<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A02. <a href=3D"https://pkg.go.d=
ev/" rel=3D"noreferrer" target=3D"_blank">https://pkg.go.dev/</a>&lt;module=
_name_tweaked&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0The module_name_tweaked is der=
ived from module_name, with the last components<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0removed one by one. Let me use=
 two examples to explain this.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0For module_name <a href=3D"htt=
p://sigs.k8s.io/json" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/json=
</a>, the <a href=3D"http://sigs.k8s.io/json" rel=3D"noreferrer" target=3D"=
_blank">sigs.k8s.io/json</a> is first used as<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0module_name_tweaked for search=
ing. And we can correctly get the repo URL, so<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0the search stops.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0For module_name <a href=3D"htt=
p://github.com/k3s-io/etcd/api/v3" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/k3s-io/etcd/api/v3</a>, the following ones are used<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0as module_name_tweaked:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/k=
3s-io/etcd/api/v3" rel=3D"noreferrer" target=3D"_blank">github.com/k3s-io/e=
tcd/api/v3</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/k=
3s-io/etcd/api" rel=3D"noreferrer" target=3D"_blank">github.com/k3s-io/etcd=
/api</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/k=
3s-io/etcd" rel=3D"noreferrer" target=3D"_blank">github.com/k3s-io/etcd</a>=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0And when searching &#39;<a hre=
f=3D"http://github.com/k3s-io/etcd" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/k3s-io/etcd</a>&#39;, we get the repo URL, so the search<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0stops.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; * determine the srcdir:destdir mapping in &#39;ve=
ndor&#39; creation<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0To correctly form the &#39;ven=
dor&#39; directory, the mapping is critical.<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0This script makes use of tag m=
atching and path matching to determine<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0the subpath in the repo for th=
e module.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; * avoid subpath being overriden by parent path<br=
>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0We need to avoid subpath being=
 overriden by parent path. This is needed<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0for both SRC_URI ordering in s=
rc_uri.inc and the sites mapping ordering<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0in relocation.inc. This script=
 simply uses the length as the ordering key,<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0simply for the reason that if =
a path is a subpath of another path, it must<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0be longer.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; * the .git suffix is removed to sync with each ot=
her<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Unlike normal recipes, go mod =
recipe usually have many SRC_URIs. This script<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0remove the &#39;.git&#39; suff=
ix from repo URL so that the repo URLs are in sync<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0with each.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; * basic directory hierarchy and caching mechanism=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;cwd&gt;/repos: hold the re=
pos downloaded and checked<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;cwd&gt;/wget-contents: hol=
d the contents to determine the module&#39;s repo<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;cwd&gt;/wget-contents/&lt;=
module_name&gt;.repo_url.cache: the repo value cache<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0This is to avoid unnecessary U=
RL fetching and repo cloning.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE swi=
tch in script<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0The script must get the correc=
t repo_url, fullsrc_rev and subpath for<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0each required module in go.mod=
 to correctly generate the src_uri.inc and<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0relocation.inc files. If this =
process fails for any required module, this<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0script stop immediately, as I =
deliberately set ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0to True in this script. The pu=
rpose is to encourage people to report<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0problems to meta-virt so that =
we can improve this script according to<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0these feedbacks. But this vari=
able can set to False, then the script<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0only records the failed module=
s in self.modules_unhandled with reasons<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0added, people can modify the g=
enerated src_uri.inc and relocation.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0to manually handle these unhan=
dled modules if they are urgent to<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0add/upgrade some go mod recipe=
s.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.C=
hen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 scripts/oe-go-mod-autogen.py | 663 +=
++++++++++++++++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 663 insertions(+)<br=
>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100755 scripts/oe-go-mod=
-autogen.py<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/scripts/oe-go-mod-autogen.py b/scrip=
ts/oe-go-mod-autogen.py<br>
&gt; &gt;&gt;&gt;&gt;&gt; new file mode 100755<br>
&gt; &gt;&gt;&gt;&gt;&gt; index 00000000..09d6133b<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/scripts/oe-go-mod-autogen.py<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,663 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#!/usr/bin/env python3<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +import os<br>
&gt; &gt;&gt;&gt;&gt;&gt; +import sys<br>
&gt; &gt;&gt;&gt;&gt;&gt; +import logging<br>
&gt; &gt;&gt;&gt;&gt;&gt; +import argparse<br>
&gt; &gt;&gt;&gt;&gt;&gt; +from collections import OrderedDict<br>
&gt; &gt;&gt;&gt;&gt;&gt; +import subprocess<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +# This switch is used to make this script error =
out ASAP, mainly for debugging purpose<br>
&gt; &gt;&gt;&gt;&gt;&gt; +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +logger =3D logging.getLogger(&#39;oe-go-mod-auto=
gen&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +loggerhandler =3D logging.StreamHandler()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +loggerhandler.setFormatter(logging.Formatter(&qu=
ot;%(levelname)s: %(message)s&quot;))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +logger.addHandler(loggerhandler)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +logger.setLevel(logging.INFO)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +class GoModTool(object):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def __init__(self, repo, rev, work=
dir):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.repo =3D repo<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rev =3D rev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.workdir =3D wor=
kdir<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Stores the actual =
module name and its related information<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {module: (repo_url=
, repo_dest_dir, fullsrcrev)}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_repoinf=
o =3D {}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {module_name: (url=
, version, destdir, fullsrcrev)}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url: place to get =
the source codes, we only support git repo<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version: module ve=
rsion, git tag or git rev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir: place to =
put the fetched source codes<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev: full s=
rc rev which is the value of SRC_REV<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For &#39;<a href=
=3D"http://github.com/Masterminds/semver/v3" rel=3D"noreferrer" target=3D"_=
blank">github.com/Masterminds/semver/v3</a> v3.1.1&#39; in go.mod:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # module_name =3D <a=
 href=3D"http://github.com/Masterminds/semver/v3" rel=3D"noreferrer" target=
=3D"_blank">github.com/Masterminds/semver/v3</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url =3D <a href=3D=
"https://github.com/Masterminds/semver" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/Masterminds/semver</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version =3D v3.1.1=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir =3D ${WORK=
DIR}/${BP}/src/${GO_IMPORT}/vendor/<a href=3D"http://github.com/Masterminds=
/semver/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Masterminds/sem=
ver/v3</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev =3D d38=
7ce7889a157b19ad7694dba39a562051f41b0<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_require=
 =3D OrderedDict()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {orig_module: (act=
ual_module, actual_version)}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_replace=
 =3D OrderedDict()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Unhandled modules<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandl=
ed =3D OrderedDict()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # store subpaths use=
d to form srcpath<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # {actual_module_nam=
e: subpath}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_subpath=
s =3D OrderedDict()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # modules&#39;s actu=
al source paths, record those that are not the same with the module itself<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_srcpath=
s =3D OrderedDict()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # store lines, comme=
nt removed<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.require_lines =
=3D []<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.replace_lines =
=3D []<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fetch repo<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fetch_and_check=
out_repo(self.repo.split(&#39;://&#39;)[1], self.repo, self.rev, checkout=
=3DTrue, get_subpath=3DFalse)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def show_go_mod_info(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Print modules_requ=
ire, modules_replace and modules_unhandled<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;modules =
required:&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in self.module=
s_require:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url, v=
ersion, destdir, fullrev =3D self.modules_require[m]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(=
&quot;%s %s %s %s&quot; % (m, version, url, fullrev))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;modules =
replace:&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in self.module=
s_replace:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual=
_module, actual_version =3D self.modules_replace[m]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(=
&quot;%s =3D&gt; %s %s&quot; % (m, actual_module, actual_version))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;modules =
unhandled:&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for m in self.module=
s_unhandled:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reason=
 =3D self.modules_unhandled[m]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(=
&quot;%s unhandled: %s&quot; % (m, reason))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def parse(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if this repo=
 needs autogen<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, repo_dest_=
dir, repo_fullrev =3D self.modules_repoinfo[self.repo.split(&#39;://&#39;)[=
1]]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(os.=
path.join(repo_dest_dir, &#39;vendor&#39;)):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;vendor direcotry has already existed for %s, no need to add other =
repos&quot; % self.repo)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 go_mod_file =3D os.p=
ath.join(repo_dest_dir, &#39;go.mod&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exist=
s(go_mod_file):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;go.mod file does not exist for %s, no need to add otehr repos&quot=
; % self.repo)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parse_go_mod(go=
_mod_file)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_go_mod_inf=
o()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def fetch_and_checkout_repo(self, =
module_name, repo_url, rev, default_protocol=3D&#39;https://&#39;, checkout=
=3DFalse, get_subpath=3DTrue):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fetch repo_url to &l=
t;workdir&gt;/repos/repo_base_name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 protocol =3D default=
_protocol<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;://&#39; in =
repo_url:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_u=
rl_final =3D repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_u=
rl_final =3D default_protocol + repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;f=
etch and checkout %s %s&quot; % (repo_url_final, rev))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repos_dir =3D os.pat=
h.join(self.workdir, &#39;repos&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exist=
s(repos_dir):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mak=
edirs(repos_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_basename =3D re=
po_url.split(&#39;/&#39;)[-1].split(&#39;.git&#39;)[0]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_dest_dir =3D os=
.path.join(repos_dir, repo_basename)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_last_name =3D=
 module_name.split(&#39;/&#39;)[-1]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot=
;fetch&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(re=
po_dest_dir):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if che=
ckout:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # check if current HEAD is rev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 headrev =3D subprocess.check_output(&#39;git rev-list=
 -1 HEAD&#39;, shell=3DTrue, cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).s=
trip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 requiredrev =3D subprocess.check_output(&#39;git rev-=
list -1 %s 2&gt;/dev/null || git rev-list -1 %s/%s&#39; % (rev, module_last=
_name, rev), shell=3DTrue, cwd=3Drepo_dest_dir).decode(&#39;utf-8&#39;).str=
ip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if headrev =3D=3D requiredrev:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"n=
oreferrer" target=3D"_blank">logger.info</a>(&quot;%s has already been fetc=
hed and checked out as required, skipping&quot; % repo_url)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_repoinfo[module_name] =3D =
(repo_url, repo_dest_dir, requiredrev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"n=
oreferrer" target=3D"_blank">logger.info</a>(&quot;HEAD of %s is not %s, wi=
ll do a clean clone&quot; % (repo_dest_dir, requiredrev))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot;clone&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" tar=
get=3D"_blank">logger.info</a>(&quot;&#39;git rev-list&#39; in %s failed, w=
ill do a clean clone&quot; % repo_dest_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot;clone&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # determine if the current repo points to the desired remote repo<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 remote_origin_url =3D subprocess.check_output(&#39;gi=
t config --get remote.origin.url&#39;, shell=3DTrue, cwd=3Drepo_dest_dir).d=
ecode(&#39;utf-8&#39;).strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if remote_origin_url.endswith(&#39;.git&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not repo_url_final.endswith(&#39;.gi=
t&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_origin_url =3D rem=
ote_origin_url[:-4]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if repo_url_final.endswith(&#39;.git&#3=
9;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_origin_url =3D rem=
ote_origin_url + &#39;.git&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if remote_origin_url !=3D repo_url_final:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"n=
oreferrer" target=3D"_blank">logger.info</a>(&quot;remote.origin.url for %s=
 is not %s, will do a clean clone&quot; % (repo_dest_dir, repo_url_final))<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot;clone&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" tar=
get=3D"_blank">logger.info</a>(&quot;&#39;git config --get remote.origin.ur=
l&#39; in %s failed, will do a clean clone&quot; % repo_dest_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 git_action =3D &quot;clone&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # No l=
ocal repo, clone it.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_ac=
tion =3D &quot;clone&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if git_action =3D=3D=
 &quot;clone&quot;:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;Removing %s&quot; % repo_dest_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpro=
cess.check_call(&#39;rm -rf %s&#39; % repo_dest_dir, shell=3DTrue)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # clone/fetch repo<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_cw=
d =3D repos_dir if git_action =3D=3D &quot;clone&quot; else repo_dest_dir<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;git %s %s in %s&quot; % (git_action, repo_url_final, git_cwd))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpro=
cess.check_call(&#39;git %s %s &gt;/dev/null 2&gt;&amp;1&#39; % (git_action=
, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.warning(&quot;Failed to %s %s in %s&quot; % (git_action, repo_url_final, g=
it_cwd))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def get_requiredrev(=
get_subpath):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import=
 re<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # chec=
k if rev is a revision or a version<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len=
(rev) =3D=3D 12 and re.match(&#39;[0-9a-f]+&#39;, rev):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rev_is_version =3D False<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rev_is_version =3D True<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # if r=
ev is not a version, &#39;git rev-list -1 &lt;rev&gt;&#39; should just succ=
eed!<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not=
 rev_is_version:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 rev_return =3D subprocess.check_output(&#39;git rev-l=
ist -1 %s 2&gt;/dev/null&#39; % rev, shell=3DTrue, cwd=3Drepo_dest_dir).dec=
ode(&#39;utf-8&#39;).strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if get_subpath:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;git branch -M toremove &am=
p;&amp; git checkout -b check_subpath %s &amp;&amp; git branch -D toremove&=
#39; % rev_return<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(cmd, shell=3DTrue=
, cwd=3Drepo_dest_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # try to get the subpath for this modul=
e<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name_parts =3D module_name.split=
(&#39;/&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len(module_name_parts) &gt; 0):<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D &#39;/&#39;.j=
oin(module_name_parts)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_to_check =3D repo_des=
t_dir + &#39;/&#39; + &#39;/&#39;.join(module_name_parts)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(dir_to_c=
heck):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.module=
s_subpaths[module_name] =3D subpath<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name=
_parts.pop(0)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return rev_return<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 logger.warning(&quot;Revision (%s) not in repo(%s)&qu=
ot; % (rev, repo_dest_dir))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return None<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the =
following codes deals with case where rev is a version<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # dete=
rmine the longest match tag, in this way, we can get the current srcpath to=
 be used in relocation.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # we f=
irst get the initial tag, which is formed from module_name and rev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module=
_parts =3D module_name.split(&#39;/&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev=
.startswith(module_parts[-1] + &#39;.&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tag =3D &#39;/&#39;.join(module_parts[:-1]) + &#39;/&#39; + rev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 last_module_part_replaced =3D True<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tag =3D &#39;/&#39;.join(module_parts) + &#39;/&#39; + rev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 last_module_part_replaced =3D False<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.debug(&quot;use %s as the initial tag for %s&quot; % (tag, module_name))<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_pa=
rts =3D tag.split(&#39;/&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while(=
len(tag_parts) &gt; 0):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 rev_return =3D subprocess.check_output(&#39;git rev-l=
ist -1 %s 2&gt;/dev/null&#39; % tag, shell=3DTrue, cwd=3Drepo_dest_dir).dec=
ode(&#39;utf-8&#39;).strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if len(tag_parts) &gt; 1:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # ensure that the subpath exists<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if get_subpath:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;git branch -=
M toremove &amp;&amp; git checkout -b check_subpath %s &amp;&amp; git branc=
h -D toremove&#39; % rev_return<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(cmd=
, shell=3DTrue, cwd=3Drepo_dest_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # get subpath for the act=
ual_module_name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if last_module_part_repla=
ced:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D=
 &#39;/&#39;.join(tag_parts[:-1]) + &#39;/&#39; + module_parts[-1]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.p=
ath.isdir(repo_dest_dir + &#39;/&#39; + subpath):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 subpath =3D &#39;/&#39;.join(tag_parts[:-1])<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpath =3D=
 &#39;/&#39;.join(tag_parts[:-1])<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(repo=
_dest_dir + &#39;/&#39; + subpath):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warn=
ing(&quot;subpath (%s) derived from tag matching does not exist in %s&quot;=
 % (subpath, repo_dest_dir))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_subpaths[mod=
ule_name] =3D subpath<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.=
info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;modules_su=
bpath[%s] =3D %s&quot; % (module_name, subpath))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return rev_return<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 tag_parts.pop(0)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 tag =3D &#39;/&#39;.join(tag_parts)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.warning(&quot;No tag matching %s&quot; % rev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 None<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 requiredrev =3D get_=
requiredrev(get_subpath)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if requiredrev:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;Got module(%s) requiredrev: %s&quot; % (module_name, requiredrev))=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if che=
ckout:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 subprocess.check_call(&#39;git checkout -b gomodautogen %s&#39; % r=
equiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.m=
odules_repoinfo[module_name] =3D (repo_url, repo_dest_dir, requiredrev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.warning(&quot;Failed to get requiredrev, repo_url =3D %s, rev =3D %s, modu=
le_name =3D %s&quot; % (repo_url, rev, module_name))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def parse_go_mod(self, go_mod_path=
):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parse go.mod file to=
 get the modules info<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First we get the r=
equire and replace lines<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The parsing logic =
assumes the replace lines come *after* the require lines<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 inrequire =3D False<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 inreplace =3D False<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(go_mod_pat=
h, &#39;r&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines =
=3D f.readlines()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for li=
ne in lines:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if line.startswith(&#39;require (&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 inrequire =3D True<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if line.startswith(&#39;)&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 inrequire =3D False<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if line.startswith(&#39;require &#39;) or inrequire:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # we have one line require<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 require_line =3D line.lstrip(&#39;require &#39;).spli=
t(&#39;//&#39;)[0].strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if require_line:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.require_lines.append(require_line)=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # we can deal with requires and replaces separately because go.mod =
always writes requires before replaces<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if line.startswith(&#39;replace (&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 inreplace =3D True<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if line.startswith(&#39;)&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 inreplace =3D False<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if line.startswith(&#39;replace &#39;) or inreplace:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 replace_line =3D line.lstrip(&#39;replace &#39;).spli=
t(&#39;//&#39;)[0].strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if replace_line:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.replace_lines.append(replace_line)=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # parse the require_=
lines and replace_lines to form self.modules_require and self.modules_repla=
ce<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;P=
arsing require_lines and replace_lines ...&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # A typical replace =
line is as below:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0<a hre=
f=3D"http://github.com/hashicorp/golang-lru" rel=3D"noreferrer" target=3D"_=
blank">github.com/hashicorp/golang-lru</a> =3D&gt; <a href=3D"http://github=
.com/ktock/golang-lru" rel=3D"noreferrer" target=3D"_blank">github.com/ktoc=
k/golang-lru</a> v0.5.5-0.20211029085301-ec551be6f75c<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It means that the =
<a href=3D"http://github.com/hashicorp/golang-lru" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/hashicorp/golang-lru</a> module is replaced by <a h=
ref=3D"http://github.com/ktock/golang-lru" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/ktock/golang-lru</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # with the version &=
#39;v0.5.5-0.20211029085301-ec551be6f75c&#39;.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # So the destdir is =
vendor/<a href=3D"http://github.com/hashicorp/golang-lru" rel=3D"noreferrer=
" target=3D"_blank">github.com/hashicorp/golang-lru</a> while the contents =
are from <a href=3D"http://github.com/ktock/golang-lru" rel=3D"noreferrer" =
target=3D"_blank">github.com/ktock/golang-lru</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in self.rep=
lace_lines:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_m=
odule, actual =3D line.split(&#39;=3D&gt;&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual=
_module, actual_version =3D actual.split()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_m=
odule =3D orig_module.strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual=
_module =3D actual_module.strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual=
_version =3D actual_version.strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.m=
odules_replace[orig_module] =3D (actual_module, actual_version)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Typical require li=
nes are as below:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0<a hre=
f=3D"http://github.com/Masterminds/semver/v3" rel=3D"noreferrer" target=3D"=
_blank">github.com/Masterminds/semver/v3</a> v3.1.1<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0<a hre=
f=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=3D"_blank">golan=
g.org/x/crypto</a> v0.0.0-20220321153916-2c7772ba3064<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to first t=
ry https://&lt;module_name&gt;?=3Dgo-get=3D1 to see it contains<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # line starting with=
 &#39;&lt;meta name=3D&quot;go-import&quot; content=3D&#39;.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If so, get root-pa=
th vcs repo-url from content. See <a href=3D"https://go.dev/ref/mod#vcs-fin=
d" rel=3D"noreferrer" target=3D"_blank">https://go.dev/ref/mod#vcs-find</a>=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For example, the a=
bove &#39;wget <a href=3D"https://golang.org/x/crypto?go-get=3D1" rel=3D"no=
referrer" target=3D"_blank">https://golang.org/x/crypto?go-get=3D1</a>&#39;=
 gives you<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &lt;meta name=3D&q=
uot;go-import&quot; content=3D&quot;<a href=3D"http://golang.org/x/crypto" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> git <a href=3D=
"https://go.googlesource.com/crypto" rel=3D"noreferrer" target=3D"_blank">h=
ttps://go.googlesource.com/crypto</a>&quot;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In such case, the =
self.modules_require has the following contents:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # module_name: <a hr=
ef=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=3D"_blank">gola=
ng.org/x/crypto</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url: <a href=3D"ht=
tps://go.googlesource.com/crypto" rel=3D"noreferrer" target=3D"_blank">http=
s://go.googlesource.com/crypto</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version: v0.0.0-20=
220321153916-2c7772ba3064<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir: ${WORKDIR=
}/${BP}/src/import/vendor.fetch/<a href=3D"http://golang.org/x/crypto" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev: 2c7772=
ba30643b7a2026cbea938420dce7c6384d (git rev-list -1 2c7772ba3064)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If not, try <a hre=
f=3D"https://pkg.go.dev/" rel=3D"noreferrer" target=3D"_blank">https://pkg.=
go.dev/</a>&lt;module_name&gt;, and find the &#39;Repository&#39;.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For example, &#39;=
wget <a href=3D"https://pkg.go.dev/github.com/Masterminds/semver/v3" rel=3D=
"noreferrer" target=3D"_blank">https://pkg.go.dev/github.com/Masterminds/se=
mver/v3</a>&#39; gives:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://=
github.com/Masterminds/semver" rel=3D"noreferrer" target=3D"_blank">github.=
com/Masterminds/semver</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In such case, the =
self.modules has the following contents:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # module_name: <a hr=
ef=3D"http://github.com/Masterminds/semver/v3" rel=3D"noreferrer" target=3D=
"_blank">github.com/Masterminds/semver/v3</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # url: <a href=3D"ht=
tps://github.com/Masterminds/semver" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/Masterminds/semver</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version: v3.1.1<br=
>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # destdir: ${WORKDIR=
}/${BP}/src/import/vendor.fetch/<a href=3D"http://github.com/Masterminds/se=
mver/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Masterminds/semver=
/v3</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fullsrcrev: 7bb0c8=
43b53d6ad21a3f619cb22c4b442bb3ef3e (git rev-list -1 v3.1.1)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # As a last resort, =
if the last component of &lt;module_name&gt; matches &#39;v[0-9]+&#39;,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove the last co=
mponent and try wget https://&lt;module_name_with_last_component_removed&gt=
;?go-get=3D1,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # then try using the=
 above matching method.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in self.req=
uire_lines:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module=
_name, version =3D line.strip().split()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.debug(&quot;require line: %s&quot; % line)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.debug(&quot;module_name =3D %s; version =3D %s&quot; % (module_name, versi=
on))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # take=
 the modules_replace into consideration to get the actual version and actua=
l module name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # note=
 that the module_name is used in destdir, and the actual_module_name and ac=
tual_version<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # are =
used to determine the url and fullsrcrev<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destdi=
r =3D &#39;${WORKDIR}/${BP}/src/import/vendor.fetch/%s&#39; % module_name<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual=
_module_name =3D module_name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual=
_version =3D version<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mod=
ule_name in self.modules_replace:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 actual_module_name, actual_version =3D self.modules_replace[module_=
name]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.debug(&quot;actual_module_name =3D %s; actual_version =3D %s&quot; % (actu=
al_module_name, actual_version))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url, f=
ullsrcrev =3D self.get_url_srcrev(actual_module_name, actual_version)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger=
.debug(&quot;url =3D %s; fullsrcrev =3D %s&quot; % (url, fullsrcrev))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url=
 and fullsrcrev:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 self.modules_require[module_name] =3D (url, version, destdir, fulls=
rcrev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # form srcpath, actual_module_name/&lt;subpath&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if actual_module_name in self.modules_subpaths:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 subpath =3D self.modules_subpaths[actual_module_name]=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 srcpath =3D &#39;%s/%s&#39; % (actual_module_name, su=
bpath)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 self.modules_srcpaths[module_name] =3D srcpath<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" tar=
get=3D"_blank">logger.info</a>(&quot;self.modules_srcpaths[%s] =3D %s&quot;=
 % (module_name, srcpath))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 self.modules_srcpaths[module_name] =3D actual_module_=
name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 logger.warning(&quot;get_url_srcrev(%s, %s) failed&quot; % (actual_=
module_name, actual_version))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def use_wget_to_get_repo_url(self,=
 wget_content_file, url_cache_file, module_name):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use wget to get repo=
_url for module_name, return None if not found<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;wget -O %s https://%s?=3Dgo-get=3D1&quot; % (wget_content_file, mo=
dule_name))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpro=
cess.check_call(&#39;wget -O %s https://%s?=3Dgo-get=3D1&#39; % (wget_conte=
nt_file, module_name), shell=3DTrue)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with o=
pen(wget_content_file, &#39;r&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 for line in f.readlines():<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if &#39;&lt;meta name=3D&quot;go-import&quot; content=
=3D&#39; in line:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"n=
oreferrer" target=3D"_blank">logger.info</a>(&quot;Succeed to find go-impor=
t content for %s&quot; % module_name)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;The line is %s&quot;=
 % line)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root_path, vcs, repo_url =3D line.split=
(&#39;content=3D&#39;)[1].split(&#39;&quot;&#39;)[1].split()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"n=
oreferrer" target=3D"_blank">logger.info</a>(&quot;%s: %s %s %s&quot; % (mo=
dule_name, root_path, vcs, repo_url))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vcs !=3D &#39;git&#39;:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&#39;%s un=
handled as its vcs is %s which is not supported by this script.&#39; % (mod=
ule_name, vcs))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_reason =3D &#39=
;vcs %s is not supported by this script&#39; % vcs<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandled[mo=
dule_name] =3D unhandled_reason<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(url_cache_file, &#39;w&#39;) =
as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(repo_url)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;wget -O %s https://%s?=3Dgo-get=3D1 failed&quot; % (wget_content_f=
ile, module_name))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if we cannot find =
repo url from https://&lt;module_name&gt;?=3Dgo-get=3D1, try <a href=3D"htt=
ps://pkg.go/dev/" rel=3D"noreferrer" target=3D"_blank">https://pkg.go/dev/<=
/a>&lt;module_name&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;wget -O %s <a href=3D"https://pkg.go.dev/%s" rel=3D"noreferrer" ta=
rget=3D"_blank">https://pkg.go.dev/%s</a>&quot; % (wget_content_file, modul=
e_name))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subpro=
cess.check_call(&quot;wget -O %s <a href=3D"https://pkg.go.dev/%s" rel=3D"n=
oreferrer" target=3D"_blank">https://pkg.go.dev/%s</a>&quot; % (wget_conten=
t_file, module_name), shell=3DTrue)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_u=
rl_found =3D False<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with o=
pen(wget_content_file, &#39;r&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 in_repo_section =3D False<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 for line in f.readlines():<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if &#39;&gt;Repository&lt;&#39; in line:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in_repo_section =3D True<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if in_repo_section:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newline =3D line.strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if newline !=3D &#39;&#39; and not newl=
ine.startswith(&#39;&lt;&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url =3D newline<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url_found =3D True<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rep=
o_url_found:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank"=
>logger.info</a>(&quot;repo url for %s: %s&quot; % (module_name, repo_url))=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 with open(url_cache_file, &#39;w&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 f.write(repo_url)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 unhandled_reason =3D &#39;cannot determine repo_url for %s&#39; % m=
odule_name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 self.modules_unhandled[module_name] =3D unhandled_reason<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return None<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;wget -O %s <a href=3D"https://pkg.go.dev/%s" rel=3D"noreferrer" ta=
rget=3D"_blank">https://pkg.go.dev/%s</a> failed&quot; % (wget_content_file=
, module_name))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 None<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def get_repo_url_rev(self, module_=
name, version):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (repo_url, re=
v)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First get rev from=
 version<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D version.split(=
&#39;+incompatible&#39;)[0]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 version_components =
=3D v.split(&#39;-&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(version_compo=
nents) =3D=3D 1:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =
=3D v<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif len(version_com=
ponents) =3D=3D 3:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len=
(version_components[2]) =3D=3D 12:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rev =3D version_components[2]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rev =3D v<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =
=3D v<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We put a cache mec=
hanism here, &lt;wget_content_file&gt;.repo_url.cache is used to store the =
repo url fetch before<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget_dir =3D os.path=
.join(self.workdir, &#39;wget-contents&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exist=
s(wget_dir):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mak=
edirs(wget_dir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget_content_file =
=3D os.path.join(wget_dir, module_name.replace(&#39;/&#39;, &#39;_&#39;))<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_cache_file =3D &=
quot;%s.repo_url.cache&quot; % wget_content_file<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(ur=
l_cache_file):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with o=
pen(url_cache_file, &#39;r&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 repo_url =3D f.readline().strip()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return (repo_url, rev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_name_parts =
=3D module_name.split(&#39;/&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len(module_na=
me_parts) &gt; 0):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module=
_name_to_check =3D &#39;/&#39;.join(module_name_parts)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</=
a>(&quot;module_name_to_check: %s&quot; % module_name_to_check)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_u=
rl =3D self.use_wget_to_get_repo_url(wget_content_file, url_cache_file, mod=
ule_name_to_check)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rep=
o_url:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return (repo_url, rev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if module_name in self.modules_unhandled:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return (None, rev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 module_name_parts.pop(-1)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_reason =3D=
 &#39;cannot determine the repo for %s&#39; % module_name<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.modules_unhandl=
ed[module_name] =3D unhandled_reason<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (None, rev)<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def get_url_srcrev(self, module_na=
me, version):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return url and fulls=
rcrev according to module_name and version<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_url, rev =3D se=
lf.get_repo_url_rev(module_name, version)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not repo_url or n=
ot rev:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 (None, None)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fetch_and_check=
out_repo(module_name, repo_url, rev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if module_name in se=
lf.modules_repoinfo:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_u=
rl, repo_dest_dir, repo_fullrev =3D self.modules_repoinfo[module_name]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # remo=
ve the .git suffix to sync repos across modules with different versions and=
 across recipes<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rep=
o_url.endswith(&#39;.git&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 repo_url =3D repo_url[:-len(&#39;.git&#39;)]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 (repo_url, repo_fullrev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unhand=
led_reason =3D &#39;fetch_and_checkout_repo(%s, %s, %s) failed&#39; % (modu=
le_name, repo_url, rev)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.m=
odules_unhandled[module_name] =3D unhandled_reason<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 (None, None)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def gen_src_uri_inc(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate src_uri.inc=
 file containing SRC_URIs<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri_inc_file =3D=
 os.path.join(self.workdir, &#39;src_uri.inc&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # record the &lt;nam=
e&gt; after writting SRCREV_&lt;name&gt;, this is to avoid modules having t=
he same basename resulting in same SRCREV_xxx<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcrev_name_recorded=
 =3D []<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 template =3D &quot;&=
quot;&quot;#=C2=A0 =C2=A0 =C2=A0 =C2=A0%s %s<br>
&gt; &gt;&gt;&gt;&gt;&gt; +# [1] git ls-remote %s %s<br>
&gt; &gt;&gt;&gt;&gt;&gt; +SRCREV_%s=3D&quot;%s&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +SRC_URI +=3D &quot;git://%s;name=3D%s;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/%s&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +&quot;&quot;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can&#39;t simpl=
y write SRC_URIs one by one in the order that go.mod specify them.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Because the latter=
 one might clean things up for the former one if the former one is a subpat=
h of the latter one.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def take_first_len(e=
lem):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 len(elem[0])<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri_contents =3D=
 []<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(src_uri_in=
c_file, &#39;w&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for mo=
dule in self.modules_require:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # {module_name: (url, version, destdir, fullsrcrev)}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 repo_url, version, destdir, fullrev =3D self.modules_require[module=
]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if module in self.modules_replace:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 actual_module_name, actual_version =3D self.modules_r=
eplace[module]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 actual_module_name, actual_version =3D (module, versi=
on)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if &#39;://&#39; in repo_url:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 repo_url_noprotocol =3D repo_url.split(&#39;://&#39;)=
[1]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 repo_url_noprotocol =3D repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if not repo_url.startswith(&#39;https://&#39;):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 repo_url =3D &#39;https://&#39; + repo_url<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 name =3D module.split(&#39;/&#39;)[-1]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if name in srcrev_name_recorded:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;-&#39;.join(module.split(&#39;/&#39;)[-=
2:])<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 src_uri_contents.append((actual_module_name, actual_version, repo_u=
rl, fullrev, name, fullrev, repo_url_noprotocol, name, actual_module_name))=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 srcrev_name_recorded.append(name)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # sort=
 the src_uri_contents and then write it<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_ur=
i_contents.sort(key=3Dtake_first_len)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for co=
ntent in src_uri_contents:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 f.write(template % content)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lo=
gger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;%s ge=
nerated&quot; % src_uri_inc_file)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def gen_relocation_inc(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate relocation.=
inc file<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 relocation_inc_file =
=3D os.path.join(self.workdir, &#39;relocation.inc&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 template =3D &quot;&=
quot;&quot;export sites=3D&quot;%s&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +do_compile:prepend() {<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 cd ${S}/src/import<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 for s in $sites; do<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 site_dest=3D$(echo $=
s | cut -d: -f1)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 site_source=3D$(echo=
 $s | cut -d: -f2)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 force_flag=3D$(echo =
$s | cut -d: -f3)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p vendor.copy=
/$site_dest<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$force=
_flag&quot; ]; then<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &q=
uot;[INFO] $site_dest: force copying .go files&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf =
vendor.copy/$site_dest<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsync -=
a --exclude=3D&#39;vendor/&#39; --exclude=3D&#39;.git/&#39; vendor.fetch/$s=
ite_source/ vendor.copy/$site_dest<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -n &=
quot;$(ls -A vendor.copy/$site_dest/*.go 2&gt; /dev/null)&quot; ] &amp;&amp=
; { echo &quot;[INFO] vendor.fetch/$site_source -&gt; $site_dest: go copy s=
kipped (files present)&quot; ; true ; } || { echo &quot;[INFO] $site_dest: =
copying .go files&quot; ; rsync -a --exclude=3D&#39;vendor/&#39; --exclude=
=3D&#39;.git/&#39; vendor.fetch/$site_source/ vendor.copy/$site_dest ; }<br=
>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 done<br>
&gt; &gt;&gt;&gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +&quot;&quot;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sites =3D []<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in self.m=
odules_require:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # &lt;=
dest&gt;:&lt;source&gt;[:force]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mod=
ule in self.modules_srcpaths:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 srcpath =3D self.modules_srcpaths[module]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 logger.debug(&quot;Using %s as srcpath of module (%s)&quot; % (srcp=
ath, module))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 srcpath =3D module<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sites.=
append(&quot;%s:%s:force&quot; % (module, srcpath))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # To avoid the forme=
r one being overriden by the latter one when the former one is a subpath of=
 the latter one, sort sites<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sites.sort(key=3Dlen=
)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(relocation=
_inc_file, &#39;w&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sites_=
str =3D &#39; \\\n=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.join(sites=
)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.writ=
e(template % sites_str)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lo=
gger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;%s ge=
nerated&quot; % relocation_inc_file)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def gen_modules_txt(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate modules.txt=
 file<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 modules_txt_file =3D=
 os.path.join(self.workdir, &#39;modules.txt&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(modules_tx=
t_file, &#39;w&#39;) as f:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l =
in self.require_lines:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 f.write(&#39;# %s\n&#39; % l)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 f.write(&#39;## explicit\n&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l =
in self.replace_lines:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 f.write(&#39;# %s\n&#39; %l)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lo=
gger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;%s ge=
nerated&quot; % modules_txt_file)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 def sanity_check(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Various anity checks=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sanity_check_ok =3D =
True<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sanity Check 1:<br=
>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=
=A0For modules having the same repo, at most one is allowed to not have sub=
path.<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=
=A0This check operates on self.modules_repoinfo and self.modules_subpaths<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_modules =3D {}<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in self.m=
odules_repoinfo:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # firs=
t form {repo: [module1, module2, ...]}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_u=
rl, repo_dest_dir, fullsrcrev =3D self.modules_repoinfo[module]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rep=
o_url not in repo_modules:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 repo_modules[repo_url] =3D [module]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 repo_modules[repo_url].append(module)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for repo in repo_mod=
ules:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module=
s =3D repo_modules[repo]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len=
(modules) =3D=3D 1:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for =
modules sharing the same repo, at most one is allowed to not have subpath<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nosubp=
ath_modules =3D []<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for m =
in modules:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if m not in self.modules_subpaths:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 nosubpath_modules.append(m)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len=
(nosubpath_modules) =3D=3D 0:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len=
(nosubpath_modules) &gt; 1:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 logger.warning(&quot;Multiple modules sharing %s, but they don&#39;=
t have subpath: %s. Please double check.&quot; % (repo, nosubpath_modules))=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len=
(nosubpath_modules) =3D=3D 1:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # do further check, OK if the module is the prefix for other module=
s sharing the same repo<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 module_to_check =3D nosubpath_modules[0]<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 for m in modules:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if module_to_check =3D=3D m:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if not m.startswith(&#39;%s/&#39; % module_to_check):=
<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&quot;%s is sharing repo=
 (%s) with other modules, and it might need a subpath. Please double check&=
quot; % (module_to_check, repo))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # End of Sanity Chec=
k<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not sanity_check_=
ok:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.ex=
it(1)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +def main():<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser=
(<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3D&quot;=
oe-go-mod-autogen.py is used to generate src_uri.inc, relocation.inc and mo=
dules.txt to be used by go mod recipes&quot;,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 epilog=3D&quot;Use %=
(prog)s --help to get help&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--repo&q=
uot;, help =3D &quot;Repo for the recipe.&quot;, required=3DTrue)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--rev&qu=
ot;, help =3D &quot;Revision for the recipe.&quot;, required=3DTrue)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--module=
&quot;, help =3D &quot;Go module name. To be used with &#39;--test&#39;&quo=
t;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--versio=
n&quot;, help =3D &quot;Go module version. To be used with &#39;--test&#39;=
&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--test&q=
uot;, help =3D &quot;Test to get repo url and fullsrcrev, used together wit=
h --module and --version.&quot;, action=3D&quot;store_true&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--workdi=
r&quot;, help =3D &quot;Working directory to hold intermediate results and =
output.&quot;, default=3Dos.getcwd())<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;-d&quot;=
, &quot;--debug&quot;,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help =3D &quot;Enable debug output&quot=
;,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;store_const&quot;, const=
=3Dlogging.DEBUG, dest=3D&quot;loglevel&quot;, default=3Dlogging.INFO)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;-q&quot;=
, &quot;--quiet&quot;,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help =3D &quot;Hide all output except e=
rror messages&quot;,<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;store_const&quot;, const=
=3Dlogging.ERROR, dest=3D&quot;loglevel&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 logger.setLevel(args.loglevel)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 logger.debug(&quot;oe-go-mod-autog=
en.py running for %s:%s in %s&quot; % (args.repo, args.rev, args.workdir))<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 gomodtool =3D GoModTool(args.repo,=
 args.rev, args.workdir)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if args.test:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not args.module o=
r not args.version:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(=
&quot;Please specify --module and --version&quot;)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.ex=
it(1)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 url, srcrev =3D gomo=
dtool.get_url_srcrev(args.module, args.version)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;url =3D =
%s, srcrev =3D %s&quot; % (url, srcrev))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not url or not sr=
crev:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(=
&quot;Failed to get url &amp; srcrev for %s:%s&quot; % (args.module, args.v=
ersion))<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.parse()<br=
>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.sanity_che=
ck()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.gen_src_ur=
i_inc()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.gen_reloca=
tion_inc()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gomodtool.gen_module=
s_txt()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +if __name__ =3D=3D &quot;__main__&quot;:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 try:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D main()<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 except Exception as esc:<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import traceback<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 traceback.print_exc(=
)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 sys.exit(ret)<br>
&gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt;&gt; 2.40.0<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8288): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8288" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8288</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101162746/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101162746/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/11553848/5052612/94736074/xyzzy" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/leave/11553848/5052=
612/94736074/xyzzy</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=
=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000001d8e07060512dbbf--

