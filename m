Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF7FC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 13:47:45 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.27422.1699624055939780353
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 05:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQca3lMt;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35941ccaa85so7958835ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Nov 2023 05:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699624055; x=1700228855; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBMGFI1FaM6g1toyyUpdy0Rx5SzGuKipuDCWThK52B0=;
        b=hQca3lMthMLOV8d0Vfy1p8k7xArXysHYIYxE6IUda/mBx9vegkszyrooExbdmN6AFB
         5Rzd0NDHaqhesgU7qkEHqRJT67wGLoPrGUT+J+9r5NKcREJeRZF+IihK9bwwTNnrM3eL
         Eji23HUPDiPVdt1z9fyf1DsH+UFzcB7QR9/e66OS3ugynCv9evUPtbJ+j3EwBSmxud/B
         vCoot+P1vIyu55WCKIz1i9TQrEmigBp+axQMgEVz3dHrz2I/twDTIKpzRDFhlYUwzk+y
         1oOn/WOnncX47zxav5WdbQC26wuGkXagsMZ3iiP33ICa+tn3jDiqHNY0vcAfmqi6VFQM
         gGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699624055; x=1700228855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBMGFI1FaM6g1toyyUpdy0Rx5SzGuKipuDCWThK52B0=;
        b=uQmpynADfo0taHVc06DcL14yL8hJ6C3Q/Dv47mywuy7VlMIaoR5z7NMJuKzHpYJ1z8
         bbYTubTBociW1zk6Wz8zL6PRXZrzFFrpf/sSXnpwsmMcKczudesc7jIy3zRrtrbB3ubW
         98z2NdtVVl9d7jEBp7f9nQjlCYTPb8+/EuWeIxry1iQH9N8I/pdRiJj9mRyPlPY2sHoq
         aiGKpnfDggyOzQuKDXJ7zDVcemn5fvtYxP5WoFkJO/9KoSk7CsAjucPh+6m/NXAKgP41
         eUlSJD2cuxrx79jIfZ5Dr/YajEfCuSwRBdLb/0uOtmfI22YPMEvOYQ+JD9bqCnNJwcJ1
         uXoQ==
X-Gm-Message-State: AOJu0YyqxXCgrvIwWpg05oyBTkb7+RrzrZlmQYl9YER8D7D/vrXZHPya
	tvSE1VUc3H5VUViQMIQBeZQlhumZOQ6pmyRjsqQ=
X-Google-Smtp-Source: AGHT+IF/sLgTXtbU0lAN1IUNuJ71XvoTuuhFQrZAdoLJBylC1HHLebOa9seZ45H1FGHAmPBvu8Eq2waXsK6STNjlCIs=
X-Received: by 2002:a05:6e02:152e:b0:352:6251:2364 with SMTP id
 i14-20020a056e02152e00b0035262512364mr9171010ilu.11.1699624055026; Fri, 10
 Nov 2023 05:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20231102130805.1285325-1-soumya.sambu@windriver.com>
 <ZUmZHuThmfjqR7XR@gmail.com> <DM6PR11MB3404FC3F43CD7267ECFE886881AEA@DM6PR11MB3404.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3404FC3F43CD7267ECFE886881AEA@DM6PR11MB3404.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Nov 2023 08:47:32 -0500
Message-ID: <CADkTA4OSEx881QbPHEQfKB6cMf+H4HoJZ+7DcXXUsaM51tpFqQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust
 patches to resolve error that occur with devtool
To: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Nov 2023 13:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8455

On Fri, Nov 10, 2023 at 7:23=E2=80=AFAM Sambu, Soumya
<Soumya.Sambu@windriver.com> wrote:
>
> devtool issue is not seen on master branch, as it got fixed with commit -=
  https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dd9af46db9aa=
9060c1ec10118b2cccabfc8264904
> There are no TMPDIR references in kirkstone branch, hence above commit ha=
s not gone to kirkstone.
>
> Do you want me to pick above commit on kirkstone to fix devtool issue or =
can I proceed with the changes that I have made?
>

Proceed with what you have. In a v2 put that explanation in the commit
log and Adjust the patches to not have the additional Signed-off-by.

Bruce

> Regards,
> Soumya
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Tuesday, November 7, 2023 7:25 AM
> To: Sambu, Soumya <Soumya.Sambu@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org>
> Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adju=
st patches to resolve error that occur with devtool
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> In message: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjus=
t patches to resolve error that occur with devtool
> on 02/11/2023 Soumya via lists.yoctoproject.org wrote:
>
> > From: Soumya Sambu <soumya.sambu@windriver.com>
> >
> > Adjust patches and .bb to fix  below error which occurs with devtool mo=
dify command -
> >
> > ERROR: Applying patch '0001-hack-lib-golang.sh-use-CC-from-environment.=
patch' on
> > target directory
> > CmdError('sh -c \'PATCHFILE=3D"0001-hack-lib-golang.sh-use-CC-from-envi=
ronment.patch"
> > git -c user.name=3D"OpenEmbedded" -c user.email=3D"oe.patch@oe" commit =
-F /tmp/tmp_ptvioq3
> > --author=3D"Koen Kooi <koen.kooi@linaro.org>"
> > --date=3D"Mon, 23 Jul 2018 15:28:02 +0200"\'', 0, 'stdout: On branch de=
vtool
> > Changes not staged for commit:
> >   (use "git add <file>..." to update what will be committed)
> >   (use "git restore <file>..." to discard changes in working directory)
> >   (commit or discard the untracked or modified content in submodules)
> > \tmodified:   src/import (modified content)
> >
> > no changes added to commit (use "git add" and/or "git commit -a")
> >
> > stderr: ')
>
> The long log should also explain the change, not just what it
> fixes.
>
> In particular, indicate that devtool insists on working out of
> a specific directory (${S} ?), and that hwe have to adjust the
> paths of our patches to that directory structure, and also update
> the recipe patch listing to be able to still apply the changes
> during a build.
>
> Also, does master have the same issue ? if so, we need to fix
> it there first.
>
> >
> > Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> > ---
> >  ...ed_files-Fix-race-issue-for-installi.patch | 20 +++++++++++--------
> >  ...sh-convert-remaining-go-calls-to-use.patch | 18 +++++++++--------
> >  ...1-cross-don-t-build-tests-by-default.patch | 12 ++++++-----
> >  ...ib-golang.sh-use-CC-from-environment.patch | 14 ++++++++-----
> >  .../kubernetes/kubernetes_git.bb              |  8 ++++----
> >  5 files changed, 42 insertions(+), 30 deletions(-)
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.gen=
erated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kuberne=
tes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.pa=
tch
> > index 02bb5e91..e0ef04dc 100644
> > --- a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_=
files-Fix-race-issue-for-installi.patch
> > +++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_=
files-Fix-race-issue-for-installi.patch
> > @@ -1,8 +1,8 @@
> >  From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
> >  From: Robert Yang <liezhi.yang@windriver.com>
> >  Date: Thu, 15 Oct 2020 07:27:35 +0000
> > -Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix r=
ace issue for installing
> > - go2make
> > +Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix r=
ace
> > + issue for installing go2make
> >
> >  The src/import/build/root/Makefile.generated_files are called several =
times during the build, so the
> >  following target which installs go2make will also run several times:
> > @@ -24,15 +24,17 @@ problem.
> >  Upstream-Status: Pending
> >
> >  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>
> There's no need to add your Signed-Off-By here, there's no
> changes in the the patch outside of context and line wrapping.
>
> Same comment for all the patches that are being tweaked.
>
> Cheers,
>
> Bruce
>
> >  ---
> > - src/import/build/root/Makefile.generated_files | 4 +++-
> > + build/root/Makefile.generated_files | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/=
src/import/build/root/Makefile.generated_files
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.ori=
g/src/import/build/root/Makefile.generated_files
> > -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src=
/import/build/root/Makefile.generated_files
> > -@@ -67,7 +67,9 @@
> > +diff --git a/build/root/Makefile.generated_files b/build/root/Makefile=
.generated_files
> > +index d86a90cbb39..19a3d332476 100644
> > +--- a/build/root/Makefile.generated_files
> > ++++ b/build/root/Makefile.generated_files
> > +@@ -67,7 +67,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
> >       if [[ "$(DBG_CODEGEN)" =3D=3D 1 ]]; then          \
> >           echo "DBG: calculating Go dependencies";  \
> >       fi
> > @@ -43,3 +45,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8=
c4d03e530d6f7630/src/import
> >       hack/run-in-gopath.sh go2make                       \
> >           k8s.io/kubernetes/...                           \
> >           --prune  k8s.io/kubernetes/staging              \
> > +--
> > +2.40.0
> > diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang=
.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes=
/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> > index 8adbafb3..39fdac54 100644
> > --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-con=
vert-remaining-go-calls-to-use.patch
> > +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-con=
vert-remaining-go-calls-to-use.patch
> > @@ -4,15 +4,17 @@ Date: Wed, 12 Aug 2020 16:01:49 +0000
> >  Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
> >
> >  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> >  ---
> >   hack/lib/golang.sh | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > -diff --git a/src/import/hack/lib/golang.sh b/src/import/hack/lib/golan=
g.sh
> > -index e9148ec08fa..71d3c987563 100755
> > ---- a/src/import/hack/lib/golang.sh
> > -+++ b/src/import/hack/lib/golang.sh
> > -@@ -651,7 +651,7 @@ kube::golang::build_some_binaries() {
> > +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> > +index d0f4b00dadf..cef0c2075a3 100755
> > +--- a/hack/lib/golang.sh
> > ++++ b/hack/lib/golang.sh
> > +@@ -654,7 +654,7 @@ kube::golang::build_some_binaries() {
> >           kube::golang::create_coverage_dummy_test "${package}"
> >           kube::util::trap_add "kube::golang::delete_coverage_dummy_tes=
t \"${package}\"" EXIT
> >
> > @@ -21,7 +23,7 @@ index e9148ec08fa..71d3c987563 100755
> >             -covermode count \
> >             -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
> >             "${build_args[@]}" \
> > -@@ -663,13 +663,13 @@ kube::golang::build_some_binaries() {
> > +@@ -666,13 +666,13 @@ kube::golang::build_some_binaries() {
> >       done
> >       if [[ "${#uncovered[@]}" !=3D 0 ]]; then
> >         V=3D2 kube::log::info "Building ${uncovered[*]} without coverag=
e..."
> > @@ -37,7 +39,7 @@ index e9148ec08fa..71d3c987563 100755
> >      fi
> >   }
> >
> > -@@ -725,7 +725,7 @@ kube::golang::build_binaries_for_platform() {
> > +@@ -730,7 +730,7 @@ kube::golang::build_binaries_for_platform() {
> >       testpkg=3D$(dirname "${test}")
> >
> >       mkdir -p "$(dirname "${outfile}")"
> > @@ -47,5 +49,5 @@ index e9148ec08fa..71d3c987563 100755
> >         -gcflags "${gogcflags:-}" \
> >         -asmflags "${goasmflags:-}" \
> >  --
> > -2.19.1
> > +2.40.0
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-=
build-tests-by-default.patch b/recipes-containers/kubernetes/kubernetes/000=
1-cross-don-t-build-tests-by-default.patch
> > index 659e3013..26a9b726 100644
> > --- a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-t=
ests-by-default.patch
> > +++ b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-t=
ests-by-default.patch
> > @@ -11,14 +11,16 @@ components without error. As such, we patch the tar=
gets out of the
> >  script to allow a successful build.
> >
> >  Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> >  ---
> >   hack/make-rules/cross.sh | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > -diff --git a/src/import/hack/make-rules/cross.sh b/hack/make-rules/cro=
ss.sh
> > -index 8e1e938..0898c5c 100755
> > ---- a/src/import/hack/make-rules/cross.sh
> > -+++ b/src/import/hack/make-rules/cross.sh
> > +diff --git a/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
> > +index f8a6d0dbf5e..d22bf52b1cc 100755
> > +--- a/hack/make-rules/cross.sh
> > ++++ b/hack/make-rules/cross.sh
> >  @@ -33,6 +33,6 @@ make all WHAT=3D"${KUBE_NODE_TARGETS[*]}" KUBE_BUILD=
_PLATFORMS=3D"${KUBE_NODE_PLATFO
> >
> >   make all WHAT=3D"${KUBE_CLIENT_TARGETS[*]}" KUBE_BUILD_PLATFORMS=3D"$=
{KUBE_CLIENT_PLATFORMS[*]}"
> > @@ -29,5 +31,5 @@ index 8e1e938..0898c5c 100755
> >  -make all WHAT=3D"${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS=
=3D"${KUBE_TEST_SERVER_PLATFORMS[*]}"
> >  +#make all WHAT=3D"${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORM=
S=3D"${KUBE_TEST_SERVER_PLATFORMS[*]}"
> >  --
> > -2.7.4
> > +2.40.0
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-gol=
ang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubern=
etes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> > index 3a22a2ef..d3b71aef 100644
> > --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-=
use-CC-from-environment.patch
> > +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-=
use-CC-from-environment.patch
> > @@ -7,15 +7,17 @@ Toolchain tupples differs, especially when using vend=
or provides ones.
> >
> >  Upstream-status: Inappropriate [embedded specific]
> >  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> >  ---
> >   hack/lib/golang.sh | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/=
src/import/hack/lib/golang.sh
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.ori=
g/src/import/hack/lib/golang.sh
> > -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src=
/import/hack/lib/golang.sh
> > -@@ -414,19 +414,15 @@
> > +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> > +index e16a60d1867..d0f4b00dadf 100755
> > +--- a/hack/lib/golang.sh
> > ++++ b/hack/lib/golang.sh
> > +@@ -420,19 +420,15 @@ kube::golang::set_platform_envs() {
> >           ;;
> >         "linux/arm")
> >           export CGO_ENABLED=3D1
> > @@ -35,3 +37,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8=
c4d03e530d6f7630/src/import
> >           ;;
> >       esac
> >     fi
> > +--
> > +2.40.0
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-=
containers/kubernetes/kubernetes_git.bb
> > index f475bd73..59892c92 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -26,10 +26,10 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes=
.git;branch=3Drelease-1.23;name=3Dk
> >             git://github.com/kubernetes/release;branch=3Dmaster;name=3D=
kubernetes-release;destsuffix=3Dgit/release;protocol=3Dhttps"
> >
> >  SRC_URI:append =3D " \
> > -           file://0001-hack-lib-golang.sh-use-CC-from-environment.patc=
h \
> > -           file://0001-cross-don-t-build-tests-by-default.patch \
> > -           file://0001-build-golang.sh-convert-remaining-go-calls-to-u=
se.patch \
> > -           file://0001-Makefile.generated_files-Fix-race-issue-for-ins=
talli.patch \
> > +           file://0001-hack-lib-golang.sh-use-CC-from-environment.patc=
h;patchdir=3Dsrc/import \
> > +           file://0001-cross-don-t-build-tests-by-default.patch;patchd=
ir=3Dsrc/import \
> > +           file://0001-build-golang.sh-convert-remaining-go-calls-to-u=
se.patch;patchdir=3Dsrc/import \
> > +           file://0001-Makefile.generated_files-Fix-race-issue-for-ins=
talli.patch;patchdir=3Dsrc/import \
> >             file://cni-containerd-net.conflist \
> >             file://k8s-init \
> >             file://99-kubernetes.conf \
> > --
> > 2.40.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8410): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8410
> > Mute This Topic: https://lists.yoctoproject.org/mt/102341396/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

