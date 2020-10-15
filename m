Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.14293.1602773907339477826
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 07:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QmH0QzYH;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id cm24so2398027edb.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Oct 2020 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7Mu/WIzA3f9yUYKPM+6PoBN9Vc6MkgvW7Aqtir5QjQ=;
        b=QmH0QzYHHLqQtLbXMvpfVhzpdtVYB7jNNb93oOLk67tnppRCLuI4kHsbJGe0E1P3KE
         boHdhpjBCqeuZT/bMJ0Z2cjxHOGEzJ5MA958TomDmRAq/6ebcmqkwj0QI3WCeOh+QcvO
         BdaRyD8KJa0xsNCvPhOscvCMKUyBOh7jWZ/+6oiU4T2cbFHkcSWqbyqVltyyqcUmCgVF
         zkvoKfOgw4ocHiEspLctSHlj4TxuYivJse7cC/rgjXMlKUZUUmjq/dtA5rncOhQm4LYy
         QHusrEGoI0ZTlor5YD8KwXb8pSAN4NJRLjFpKFgWMQqQtgS67n6Cq0XwuVHn2YbvNRSQ
         0phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7Mu/WIzA3f9yUYKPM+6PoBN9Vc6MkgvW7Aqtir5QjQ=;
        b=Nf6slW/Pf0G3cf6LVKdQdcGInWakfem7OzoATXde8oUEK9Tiukm7UMuhd0DFDMY9CM
         VyHn+/w1LncwHwC7JU6/F95B4Y8bEwTAxnf1KfaF47QFM+e1h/hj78/EXWvG2C+X1oOf
         kUtUmaz6t0RW9hg3rY5OSW0wSUyb+OcM/US3J24WwcBVYGpupzjy0nl85k+bHt/XkFjV
         yEOwxDqMwsWFJKI5ZZ6A2uOuyctrfjhzHN94admgYg81jf4h4fZDf+J1jGIXRy4lfP7T
         IhPfrYnTDa3HvcCFXmHYoEEEagjr1APZeBRN7Zr5hb5HVf9HVy5p0jduM11wawfIDy9k
         DLKQ==
X-Gm-Message-State: AOAM533qjg7BvuRyDu5zKcMa/U/dol4ww0naXFkUSlcxH++NYlumQ/MS
	3pyMB70EPS64LFr3Pc1UzkZxxrAT1fWTz2YihFaTbk8PTCynfw==
X-Google-Smtp-Source: ABdhPJyg0p+D+hXLaFlixs3O5x8jQwunkiX0ijj3CPROZupn4YNq821CdzZer4oSMSGBjq1FFQR9WpA57KRdnoS8+RY=
X-Received: by 2002:a05:6402:16c9:: with SMTP id r9mr4648256edx.27.1602773905814;
 Thu, 15 Oct 2020 07:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201015090104.26472-1-liezhi.yang@windriver.com>
In-Reply-To: <20201015090104.26472-1-liezhi.yang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Oct 2020 10:58:14 -0400
Message-ID: <CADkTA4PDhSKtazcKPQ7nP1E5vycCnB_Dt4FvWJHgmC+GsiPHXA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kubernetes: Fix race issue for installing go2make
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004fd0ae05b1b6e165"

--0000000000004fd0ae05b1b6e165
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Oct 15, 2020 at 5:01 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> The src/import/build/root/Makefile.generated_files are called several times
> during the build, so the following target which installs go2make will also
> run
> several times:
>
> $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
>
> It runs automatically when the Makefile is called because of:
> sinclude $(META_DIR)/$(GO_PKGDEPS_FILE)
>
> So there is a race issue of go2make when parallel build:
> hack/run-in-gopath.sh: line 34:
> build/tmp-glibc/work/corei7-64-wrs-linux/kubernetes/1.18.8-r0/git/src/import/_output/local/go/bin/go2make:
> No suc h file or directory
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...ed_files-Fix-race-issue-for-installi.patch | 48 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644
> recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
>
> diff --git
> a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> new file mode 100644
> index 0000000..97273e4
> --- /dev/null
> +++
> b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> @@ -0,0 +1,48 @@
> +From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Thu, 15 Oct 2020 07:27:35 +0000
> +Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race
> issue for installing
> + go2make
> +
> +The src/import/build/root/Makefile.generated_files are called several
> times during the build, so the
> +following target which installs go2make will also run several times:
> +
> +$(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
> +
> +It runs automatically when the Makefile is called because of:
> +sinclude $(META_DIR)/$(GO_PKGDEPS_FILE)
> +
> +So there is a race issue of go2make when parallel build:
> +hack/run-in-gopath.sh: line 34:
> build/tmp-glibc/work/corei7-64-wrs-linux/kubernetes/1.18.8-r0/git/src/import/_output/local/go/bin/go2make:
> No such file or directory
> +
> +It is because the first process is using go2make, but then the second
> process
> +removes it and reinstall it.
> +
> +Check whether go2make has been installed or not before install it can fix
> the
> +problem.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + src/import/build/root/Makefile.generated_files | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/import/build/root/Makefile.generated_files
> b/src/import/build/root/Makefile.generated_files
> +index c8cbf27..e3f1593 100644
> +--- a/src/import/build/root/Makefile.generated_files
> ++++ b/src/import/build/root/Makefile.generated_files
> +@@ -63,7 +63,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
> +       if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
> +           echo "DBG: calculating Go dependencies";  \
> +       fi
> +-      hack/run-in-gopath.sh go install ./hack/make-rules/helpers/go2make
> ++      if [ ! -e _output/local/go/bin/go2make ]; then \
> ++              hack/run-in-gopath.sh go install
> ./hack/make-rules/helpers/go2make; \
> ++      fi
> +       hack/run-in-gopath.sh go2make                     \
> +           k8s.io/kubernetes/...                         \
> +           --prune  k8s.io/kubernetes/staging            \
> +--
> +2.26.2
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index 76c8202..1053d97 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://
> github.com/kubernetes/kubernetes.git;branch=release-1.19;name=k
>             file://0001-cross-don-t-build-tests-by-default.patch \
>             file://0001-generate-bindata-unset-GOBIN.patch \
>
> file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
> +
>  file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
>            "
>
>  DEPENDS += "rsync-native \
> --
> 2.17.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004fd0ae05b1b6e165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oc=
t 15, 2020 at 5:01 AM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriv=
er.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The src/import/build/root/Makefile.generat=
ed_files are called several times<br>
during the build, so the following target which installs go2make will also =
run<br>
several times:<br>
<br>
$(META_DIR)/$(GO_PKGDEPS_FILE): FORCE<br>
<br>
It runs automatically when the Makefile is called because of:<br>
sinclude $(META_DIR)/$(GO_PKGDEPS_FILE)<br>
<br>
So there is a race issue of go2make when parallel build:<br>
hack/run-in-gopath.sh: line 34: build/tmp-glibc/work/corei7-64-wrs-linux/ku=
bernetes/1.18.8-r0/git/src/import/_output/local/go/bin/go2make: No suc h fi=
le or directory<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0...ed_files-Fix-race-issue-for-installi.patch | 48 ++++++++++++++++++=
+<br>
=C2=A0.../kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 49 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Make=
file.generated_files-Fix-race-issue-for-installi.patch<br>
<br>
diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generat=
ed_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubernetes/=
kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch<=
br>
new file mode 100644<br>
index 0000000..97273e4<br>
--- /dev/null<br>
+++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_file=
s-Fix-race-issue-for-installi.patch<br>
@@ -0,0 +1,48 @@<br>
+From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001<br>
+From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=
=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
+Date: Thu, 15 Oct 2020 07:27:35 +0000<br>
+Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race =
issue for installing<br>
+ go2make<br>
+<br>
+The src/import/build/root/Makefile.generated_files are called several time=
s during the build, so the<br>
+following target which installs go2make will also run several times:<br>
+<br>
+$(META_DIR)/$(GO_PKGDEPS_FILE): FORCE<br>
+<br>
+It runs automatically when the Makefile is called because of:<br>
+sinclude $(META_DIR)/$(GO_PKGDEPS_FILE)<br>
+<br>
+So there is a race issue of go2make when parallel build:<br>
+hack/run-in-gopath.sh: line 34: build/tmp-glibc/work/corei7-64-wrs-linux/k=
ubernetes/1.18.8-r0/git/src/import/_output/local/go/bin/go2make: No such fi=
le or directory<br>
+<br>
+It is because the first process is using go2make, but then the second proc=
ess<br>
+removes it and reinstall it.<br>
+<br>
+Check whether go2make has been installed or not before install it can fix =
the<br>
+problem.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com=
" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
+---<br>
+ src/import/build/root/Makefile.generated_files | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/import/build/root/Makefile.generated_files b/src/import/b=
uild/root/Makefile.generated_files<br>
+index c8cbf27..e3f1593 100644<br>
+--- a/src/import/build/root/Makefile.generated_files<br>
++++ b/src/import/build/root/Makefile.generated_files<br>
+@@ -63,7 +63,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [[ &quot;$(DBG_CODEGEN)&quot; =3D=3D 1 ]]; t=
hen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;DBG: calculating Go de=
pendencies&quot;;=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+-=C2=A0 =C2=A0 =C2=A0 hack/run-in-gopath.sh go install ./hack/make-rules/h=
elpers/go2make<br>
++=C2=A0 =C2=A0 =C2=A0 if [ ! -e _output/local/go/bin/go2make ]; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hack/run-in-gopath.sh go=
 install ./hack/make-rules/helpers/go2make; \<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hack/run-in-gopath.sh go2make=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/kubernet=
es/." rel=3D"noreferrer" target=3D"_blank">k8s.io/kubernetes/.</a>..=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--prune=C2=A0 <a href=3D"http://k=
8s.io/kubernetes/staging" rel=3D"noreferrer" target=3D"_blank">k8s.io/kuber=
netes/staging</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+-- <br>
+2.26.2<br>
+<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git=
.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/recipes-c=
ontainers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a><br>
index 76c8202..1053d97 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/kube=
rnetes/kubernetes.git;branch=3Drelease-1.19;name=3Dk" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/kubernetes/kubernetes.git;branch=3Drelease-1.19;=
name=3Dk</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cross-don-t-build-tes=
ts-by-default.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-generate-bindata-unse=
t-GOBIN.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-golang.sh-conve=
rt-remaining-go-calls-to-use.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.generated_fi=
les-Fix-race-issue-for-installi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;rsync-native \<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000004fd0ae05b1b6e165--
