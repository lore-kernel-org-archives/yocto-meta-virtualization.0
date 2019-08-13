Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5161AE00DA3; Tue, 13 Aug 2019 05:34:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.177 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34C20E00B3E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 05:34:48 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id x4so9250374ljj.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=srT1TB2FBteuE1QLtiUoa6HW+HtefEmQXWWoPaqmR9Y=;
	b=r2K1kivDfcGy9QWJJKiYsQJYq+NxQdAdVI1IBWpdohkd49eucQH5zYz9b1SR2NXGSx
	YTB+luzek2ijXdxRoIYQckx5tvAFd20ChcIWXOS+5oBOfnBSlnbgPTnVk2QdHqTAcJVT
	2r2+LvmZYI72iv9PRnUL5MMT7JXAVCnzPIQxzEUn/lMnXMnRGvG3mqEmcuWRo3JVNMFe
	kRCpdhXt9rq1uZNUIksrG/MudkBbexX2bPUE3iD/UEOGxKjZ+E04rQQGeWQlbnWez2Gb
	AOOEJ2egh2s/O77apfhFyt86Jbshsz7w0umP7v4kaiyr1N5W7AJXsy2rE85RKwFR9kQR
	7hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=srT1TB2FBteuE1QLtiUoa6HW+HtefEmQXWWoPaqmR9Y=;
	b=pxJdYDMhX6OCyujzmuMd7dsw4VYDKORq8ex9aGDjSI9F4jqDDthmwEXfOJNoO8Tfxo
	Jc3etEZYqbROzmtx3MZ4Y39KDutmNbaEeSeTLkZxe9UzDCB+LAtkSdPUHLo+1crCfrhL
	YHRVoKBajeonusO97JgfreJgALC6EjmqcgBnFEee3Php3ZpjYsBWp9kXbDaiOmFN8pA1
	SwMF/q9AMUchrcNULzYA4lSin4z2rW3oQ6ScZ1bsLListvT3P0zLXgC3L274MIFzusZP
	sh1CHJEixwluCOhjoSTcVP+FatRGmzM/nnwiNxQyGjMvoJcXD6039n0NXbxQGC1vdOoV
	Hoqg==
X-Gm-Message-State: APjAAAX8zZ/qNsg15Xsx5EZifiNnuJ/I6chW0i3W8A0DWqkIVddF/8sH
	cEnAepPl+hAuZ0tX5wUO3bnn8lMwVu66yOJHSk8=
X-Google-Smtp-Source: APXvYqyu9r1wTX/DzX9HRnUEeFowQDh33FfVJCr3togmgH6JHKKrH2uz9AeZMNwW8UcQgBId/Yslgdf2vnT2kMWj1bk=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr20926074lja.87.1565699686910; 
	Tue, 13 Aug 2019 05:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<20190813075136.6248-2-Qi.Chen@windriver.com>
In-Reply-To: <20190813075136.6248-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 08:34:35 -0400
Message-ID: <CADkTA4Oy9bXZ7AVshwBPAf1C+t9HecLpywV=3pG0EX7qU1c8LA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/4] cni: extract common settings to cni.inc
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 12:34:51 -0000
Content-Type: multipart/alternative; boundary="000000000000a9d09a058ffeddd3"

--000000000000a9d09a058ffeddd3
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 3:52 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Extract common settings of two cni recipe into cni.inc.
> Add comment in recipe file to explicitly state what the version is for.
> More sepcifically, the git version is used to track latest upstream,
> while the 0.7.1 version is used to ensure basic setup works for k8s.
>

As I mentioned, we won't do this. It doubles the maintenance and shows a
fundamental API / ABI incompatibility if we can't use the different
versions against a released k8s.

There is one version of the recipe, and I've always had it working for the
released kubernetes and master. I'm not seeing any issues with the latest
and my k8s configs, so I'm not sure what you are running into that I'm not.

Bruce



>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/cni/cni.inc      | 79 +++++++++++++++++++++++++++++
>  recipes-networking/cni/cni_0.7.1.bb | 71 +-------------------------
>  recipes-networking/cni/cni_git.bb   | 73 +-------------------------
>  3 files changed, 83 insertions(+), 140 deletions(-)
>  create mode 100644 recipes-networking/cni/cni.inc
>
> diff --git a/recipes-networking/cni/cni.inc
> b/recipes-networking/cni/cni.inc
> new file mode 100644
> index 0000000..7a3b87f
> --- /dev/null
> +++ b/recipes-networking/cni/cni.inc
> @@ -0,0 +1,79 @@
> +HOMEPAGE = "https://github.com/containernetworking/cni"
> +SUMMARY = "Container Network Interface - networking for Linux containers"
> +DESCRIPTION = "CNI (Container Network Interface), a Cloud Native
> Computing \
> +Foundation project, consists of a specification and libraries for writing
> \
> +plugins to configure network interfaces in Linux containers, along with a
> \
> +number of supported plugins. CNI concerns itself only with network
> connectivity \
> +of containers and removing allocated resources when the container is
> deleted. \
> +Because of this focus, CNI has a wide range of support and the
> specification \
> +is simple to implement. \
> +"
> +
> +# 0.7.1
> +SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
> +# 0.7.5
> +SRCREV_plugins = "a62711a5da7a2dc2eb93eac47e103738ad923fd6"
> +SRC_URI = "\
> +       git://
> github.com/containernetworking/cni.git;branch=master;name=cni \
> +        git://
> github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins
> \
> +       "
> +
> +RPROVIDES_${PN} += "kubernetes-cni"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
> +
> +GO_IMPORT = "import"
> +
> +PV = "0.7.1"
> +
> +inherit go
> +inherit goarch
> +
> +do_compile() {
> +       # link fixups for compilation
> +       rm -f ${S}/src/import/vendor/src
> +       mkdir -p ${S}/src/import/vendor/
> +       ln -sf ./ ${S}/src/import/vendor/src
> +       rm -rf ${S}/src/import/plugins
> +       rm -rf ${S}/src/import/vendor/
> github.com/containernetworking/plugins
> +
> +       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
> +
> +       ln -sf ../../../../libcni ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> +       ln -sf ../../../../pkg ${S}/src/import/vendor/
> github.com/containernetworking/cni/pkg
> +       ln -sf ../../../../cnitool ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> +       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/
> github.com/containernetworking/plugins
> +
> +       export
> GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +       export CGO_ENABLED="1"
> +
> +       cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> +       ${GO} build
> +
> +       cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> +       ${GO} build
> +
> +       cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
> +       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d
> plugins/main/* | grep -v windows)"
> +       mkdir -p ${WORKDIR}/plugins/bin/
> +       for p in $PLUGINS; do
> +           plugin="$(basename "$p")"
> +           echo "building: $p"
> +           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
> github.com/containernetworking/plugins/$p
> +       done
> +}
> +
> +do_install() {
> +    localbindir="/opt/cni/bin"
> +
> +    install -d ${D}${localbindir}
> +    install -d ${D}/${sysconfdir}/cni/net.d
> +
> +    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
> +    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
> +}
> +
> +FILES_${PN} += "/opt/cni/bin/*"
> +
> +INSANE_SKIP_${PN} += "ldflags already-stripped"
> diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni/
> cni_0.7.1.bb
> index 7a3b87f..7977040 100644
> --- a/recipes-networking/cni/cni_0.7.1.bb
> +++ b/recipes-networking/cni/cni_0.7.1.bb
> @@ -1,13 +1,5 @@
> -HOMEPAGE = "https://github.com/containernetworking/cni"
> -SUMMARY = "Container Network Interface - networking for Linux containers"
> -DESCRIPTION = "CNI (Container Network Interface), a Cloud Native
> Computing \
> -Foundation project, consists of a specification and libraries for writing
> \
> -plugins to configure network interfaces in Linux containers, along with a
> \
> -number of supported plugins. CNI concerns itself only with network
> connectivity \
> -of containers and removing allocated resources when the container is
> deleted. \
> -Because of this focus, CNI has a wide range of support and the
> specification \
> -is simple to implement. \
> -"
> +# This cni version is here to ensure that basic k8s setup with flannel
> could work.
> +require cni.inc
>
>  # 0.7.1
>  SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
> @@ -17,63 +9,4 @@ SRC_URI = "\
>         git://
> github.com/containernetworking/cni.git;branch=master;name=cni \
>          git://
> github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins
> \
>         "
> -
> -RPROVIDES_${PN} += "kubernetes-cni"
> -
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
> -
> -GO_IMPORT = "import"
> -
>  PV = "0.7.1"
> -
> -inherit go
> -inherit goarch
> -
> -do_compile() {
> -       # link fixups for compilation
> -       rm -f ${S}/src/import/vendor/src
> -       mkdir -p ${S}/src/import/vendor/
> -       ln -sf ./ ${S}/src/import/vendor/src
> -       rm -rf ${S}/src/import/plugins
> -       rm -rf ${S}/src/import/vendor/
> github.com/containernetworking/plugins
> -
> -       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
> -
> -       ln -sf ../../../../libcni ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> -       ln -sf ../../../../pkg ${S}/src/import/vendor/
> github.com/containernetworking/cni/pkg
> -       ln -sf ../../../../cnitool ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> -       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/
> github.com/containernetworking/plugins
> -
> -       export
> GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -       export CGO_ENABLED="1"
> -
> -       cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> -       ${GO} build
> -
> -       cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> -       ${GO} build
> -
> -       cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
> -       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d
> plugins/main/* | grep -v windows)"
> -       mkdir -p ${WORKDIR}/plugins/bin/
> -       for p in $PLUGINS; do
> -           plugin="$(basename "$p")"
> -           echo "building: $p"
> -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
> github.com/containernetworking/plugins/$p
> -       done
> -}
> -
> -do_install() {
> -    localbindir="/opt/cni/bin"
> -
> -    install -d ${D}${localbindir}
> -    install -d ${D}/${sysconfdir}/cni/net.d
> -
> -    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
> -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
> -}
> -
> -FILES_${PN} += "/opt/cni/bin/*"
> -
> -INSANE_SKIP_${PN} += "ldflags already-stripped"
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index 5348b95..06b37a4 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -1,13 +1,5 @@
> -HOMEPAGE = "https://github.com/containernetworking/cni"
> -SUMMARY = "Container Network Interface - networking for Linux containers"
> -DESCRIPTION = "CNI (Container Network Interface), a Cloud Native
> Computing \
> -Foundation project, consists of a specification and libraries for writing
> \
> -plugins to configure network interfaces in Linux containers, along with a
> \
> -number of supported plugins. CNI concerns itself only with network
> connectivity \
> -of containers and removing allocated resources when the container is
> deleted. \
> -Because of this focus, CNI has a wide range of support and the
> specification \
> -is simple to implement. \
> -"
> +# This cni version is supposed to track latest upstream.
> +require cni.inc
>
>  SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
>  SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
> @@ -15,65 +7,4 @@ SRC_URI = "\
>         git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
>          git://
> github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins
> \
>         "
> -
> -RPROVIDES_${PN} += "kubernetes-cni"
> -
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
> -
> -GO_IMPORT = "import"
> -
>  PV = "0.7.0+git${SRCREV_cni}"
> -
> -inherit go
> -inherit goarch
> -
> -do_compile() {
> -       # link fixups for compilation
> -       rm -f ${S}/src/import/vendor/src
> -       mkdir -p ${S}/src/import/vendor/
> -       ln -sf ./ ${S}/src/import/vendor/src
> -       rm -rf ${S}/src/import/plugins
> -       rm -rf ${S}/src/import/vendor/
> github.com/containernetworking/plugins
> -
> -       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
> -
> -       ln -sf ../../../../libcni ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> -       ln -sf ../../../../pkg ${S}/src/import/vendor/
> github.com/containernetworking/cni/pkg
> -       ln -sf ../../../../cnitool ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> -       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/
> github.com/containernetworking/plugins
> -
> -       export
> GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -       export CGO_ENABLED="1"
> -
> -       cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> -       ${GO} build
> -
> -       cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> -       ${GO} build
> -
> -       cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
> -       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d
> plugins/main/* | grep -v windows)"
> -       mkdir -p ${WORKDIR}/plugins/bin/
> -       for p in $PLUGINS; do
> -           plugin="$(basename "$p")"
> -           echo "building: $p"
> -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
> github.com/containernetworking/plugins/$p
> -       done
> -}
> -
> -do_install() {
> -    localbindir="/opt/cni/bin"
> -
> -    install -d ${D}${localbindir}
> -    install -d ${D}/${sysconfdir}/cni/net.d
> -
> -    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
> -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
> -}
> -
> -FILES_${PN} += "/opt/cni/bin/*"
> -
> -INSANE_SKIP_${PN} += "ldflags already-stripped"
> -
> -deltask compile_ptest_base
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a9d09a058ffeddd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 13, 2019 at 3:52 AM Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Extract common setti=
ngs of two cni recipe into cni.inc.<br>
Add comment in recipe file to explicitly state what the version is for.<br>
More sepcifically, the git version is used to track latest upstream,<br>
while the 0.7.1 version is used to ensure basic setup works for k8s.<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">As I mentioned, we won&#39;t do this. It doubles the maintenance =
and shows a fundamental API / ABI incompatibility if we can&#39;t use the d=
ifferent versions against a released k8s.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">There is one version of the recipe, and I&#39;ve always ha=
d it working for the released kubernetes and master. I&#39;m not seeing any=
 issues with the latest and my k8s configs, so I&#39;m not sure what you ar=
e running into that I&#39;m not.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/cni.inc=C2=A0 =C2=A0 =C2=A0 | 79 +++++++++++++=
++++++++++++++++<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_0.7.1.bb" rel=3D"norefer=
rer" target=3D"_blank">cni_0.7.1.bb</a> | 71 +-------------------------<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a>=C2=A0 =C2=A0| 73 +---------------------=
----<br>
=C2=A03 files changed, 83 insertions(+), 140 deletions(-)<br>
=C2=A0create mode 100644 recipes-networking/cni/cni.inc<br>
<br>
diff --git a/recipes-networking/cni/cni.inc b/recipes-networking/cni/cni.in=
c<br>
new file mode 100644<br>
index 0000000..7a3b87f<br>
--- /dev/null<br>
+++ b/recipes-networking/cni/cni.inc<br>
@@ -0,0 +1,79 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/containernetworking/cni" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/containernetworking=
/cni</a>&quot;<br>
+SUMMARY =3D &quot;Container Network Interface - networking for Linux conta=
iners&quot;<br>
+DESCRIPTION =3D &quot;CNI (Container Network Interface), a Cloud Native Co=
mputing \<br>
+Foundation project, consists of a specification and libraries for writing =
\<br>
+plugins to configure network interfaces in Linux containers, along with a =
\<br>
+number of supported plugins. CNI concerns itself only with network connect=
ivity \<br>
+of containers and removing allocated resources when the container is delet=
ed. \<br>
+Because of this focus, CNI has a wide range of support and the specificati=
on \<br>
+is simple to implement. \<br>
+&quot;<br>
+<br>
+# 0.7.1<br>
+SRCREV_cni =3D &quot;4cfb7b568922a3c79a23e438dc52fe537fc9687e&quot;<br>
+# 0.7.5<br>
+SRCREV_plugins =3D &quot;a62711a5da7a2dc2eb93eac47e103738ad923fd6&quot;<br=
>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/containernet=
working/cni.git;branch=3Dmaster;name=3Dcni" rel=3D"noreferrer" target=3D"_b=
lank">github.com/containernetworking/cni.git;branch=3Dmaster;name=3Dcni</a>=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/containerne=
tworking/plugins.git;branch=3Dv0.7;destsuffix=3Dplugins;name=3Dplugins" rel=
=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugins.gi=
t;branch=3Dv0.7;destsuffix=3Dplugins;name=3Dplugins</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+RPROVIDES_${PN} +=3D &quot;kubernetes-cni&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3Dfa818a259cbed7c=
e8bc2a22d35a464fc&quot;<br>
+<br>
+GO_IMPORT =3D &quot;import&quot;<br>
+<br>
+PV =3D &quot;0.7.1&quot;<br>
+<br>
+inherit go<br>
+inherit goarch<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# link fixups for compilation<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/import/vendor/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/src/import/vendor/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/src/import/plugins<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/src/import/vendor/<a href=3D"http:/=
/github.com/containernetworking/plugins" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/plugins</a><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<a href=3D"http=
://github.com/containernetworking/cni" rel=3D"noreferrer" target=3D"_blank"=
>github.com/containernetworking/cni</a><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../libcni ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/cni/libcni" rel=3D"noref=
errer" target=3D"_blank">github.com/containernetworking/cni/libcni</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../pkg ${S}/src/import/vendor/<=
a href=3D"http://github.com/containernetworking/cni/pkg" rel=3D"noreferrer"=
 target=3D"_blank">github.com/containernetworking/cni/pkg</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../cnitool ${S}/src/import/vend=
or/<a href=3D"http://github.com/containernetworking/cni/cnitool" rel=3D"nor=
eferrer" target=3D"_blank">github.com/containernetworking/cni/cnitool</a><b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${WORKDIR}/plugins ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/plugins" rel=3D"noreferr=
er" target=3D"_blank">github.com/containernetworking/plugins</a><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/libcni" rel=3D"noreferrer" target=3D"_blank=
">github.com/containernetworking/cni/libcni</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/cnitool" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni/cnitool</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/plugins/" rel=3D"noreferrer" target=3D"_blank">=
github.com/containernetworking/plugins/</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PLUGINS=3D&quot;$(ls -d plugins/meta/*; ls -d p=
lugins/ipam/*; ls -d plugins/main/* | grep -v windows)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/plugins/bin/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for p in $PLUGINS; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugin=3D&quot;$(basename &quot;$=
p&quot;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;building: $p&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build -o ${WORKDIR}/plugins=
/bin/$plugin <a href=3D"http://github.com/containernetworking/plugins/$p" r=
el=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugins/=
$p</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 localbindir=3D&quot;/opt/cni/bin&quot;<br>
+<br>
+=C2=A0 =C2=A0 install -d ${D}${localbindir}<br>
+=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/cni/net.d<br>
+<br>
+=C2=A0 =C2=A0 install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localb=
indir}<br>
+=C2=A0 =C2=A0 install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindi=
r}<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot;/opt/cni/bin/*&quot;<br>
+<br>
+INSANE_SKIP_${PN} +=3D &quot;ldflags already-stripped&quot;<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_0.7.1.bb" rel=3D"=
noreferrer" target=3D"_blank">cni_0.7.1.bb</a> b/recipes-networking/cni/<a =
href=3D"http://cni_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">cni_0.7.1=
.bb</a><br>
index 7a3b87f..7977040 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_0.7.1.bb" rel=3D"norefer=
rer" target=3D"_blank">cni_0.7.1.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_0.7.1.bb" rel=3D"norefer=
rer" target=3D"_blank">cni_0.7.1.bb</a><br>
@@ -1,13 +1,5 @@<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/containernetworking/cni" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/containernetworking=
/cni</a>&quot;<br>
-SUMMARY =3D &quot;Container Network Interface - networking for Linux conta=
iners&quot;<br>
-DESCRIPTION =3D &quot;CNI (Container Network Interface), a Cloud Native Co=
mputing \<br>
-Foundation project, consists of a specification and libraries for writing =
\<br>
-plugins to configure network interfaces in Linux containers, along with a =
\<br>
-number of supported plugins. CNI concerns itself only with network connect=
ivity \<br>
-of containers and removing allocated resources when the container is delet=
ed. \<br>
-Because of this focus, CNI has a wide range of support and the specificati=
on \<br>
-is simple to implement. \<br>
-&quot;<br>
+# This cni version is here to ensure that basic k8s setup with flannel cou=
ld work.<br>
+require cni.inc<br>
<br>
=C2=A0# 0.7.1<br>
=C2=A0SRCREV_cni =3D &quot;4cfb7b568922a3c79a23e438dc52fe537fc9687e&quot;<b=
r>
@@ -17,63 +9,4 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/containernet=
working/cni.git;branch=3Dmaster;name=3Dcni" rel=3D"noreferrer" target=3D"_b=
lank">github.com/containernetworking/cni.git;branch=3Dmaster;name=3Dcni</a>=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/contai=
nernetworking/plugins.git;branch=3Dv0.7;destsuffix=3Dplugins;name=3Dplugins=
" rel=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugi=
ns.git;branch=3Dv0.7;destsuffix=3Dplugins;name=3Dplugins</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-RPROVIDES_${PN} +=3D &quot;kubernetes-cni&quot;<br>
-<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3Dfa818a259cbed7c=
e8bc2a22d35a464fc&quot;<br>
-<br>
-GO_IMPORT =3D &quot;import&quot;<br>
-<br>
=C2=A0PV =3D &quot;0.7.1&quot;<br>
-<br>
-inherit go<br>
-inherit goarch<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# link fixups for compilation<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/import/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/src/import/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/src/import/plugins<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/src/import/vendor/<a href=3D"http:/=
/github.com/containernetworking/plugins" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/plugins</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<a href=3D"http=
://github.com/containernetworking/cni" rel=3D"noreferrer" target=3D"_blank"=
>github.com/containernetworking/cni</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../libcni ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/cni/libcni" rel=3D"noref=
errer" target=3D"_blank">github.com/containernetworking/cni/libcni</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../pkg ${S}/src/import/vendor/<=
a href=3D"http://github.com/containernetworking/cni/pkg" rel=3D"noreferrer"=
 target=3D"_blank">github.com/containernetworking/cni/pkg</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../cnitool ${S}/src/import/vend=
or/<a href=3D"http://github.com/containernetworking/cni/cnitool" rel=3D"nor=
eferrer" target=3D"_blank">github.com/containernetworking/cni/cnitool</a><b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${WORKDIR}/plugins ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/plugins" rel=3D"noreferr=
er" target=3D"_blank">github.com/containernetworking/plugins</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/libcni" rel=3D"noreferrer" target=3D"_blank=
">github.com/containernetworking/cni/libcni</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/cnitool" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni/cnitool</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/plugins/" rel=3D"noreferrer" target=3D"_blank">=
github.com/containernetworking/plugins/</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PLUGINS=3D&quot;$(ls -d plugins/meta/*; ls -d p=
lugins/ipam/*; ls -d plugins/main/* | grep -v windows)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/plugins/bin/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for p in $PLUGINS; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugin=3D&quot;$(basename &quot;$=
p&quot;)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;building: $p&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build -o ${WORKDIR}/plugins=
/bin/$plugin <a href=3D"http://github.com/containernetworking/plugins/$p" r=
el=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugins/=
$p</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 localbindir=3D&quot;/opt/cni/bin&quot;<br>
-<br>
-=C2=A0 =C2=A0 install -d ${D}${localbindir}<br>
-=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/cni/net.d<br>
-<br>
-=C2=A0 =C2=A0 install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localb=
indir}<br>
-=C2=A0 =C2=A0 install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindi=
r}<br>
-}<br>
-<br>
-FILES_${PN} +=3D &quot;/opt/cni/bin/*&quot;<br>
-<br>
-INSANE_SKIP_${PN} +=3D &quot;ldflags already-stripped&quot;<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index 5348b95..06b37a4 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -1,13 +1,5 @@<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/containernetworking/cni" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/containernetworking=
/cni</a>&quot;<br>
-SUMMARY =3D &quot;Container Network Interface - networking for Linux conta=
iners&quot;<br>
-DESCRIPTION =3D &quot;CNI (Container Network Interface), a Cloud Native Co=
mputing \<br>
-Foundation project, consists of a specification and libraries for writing =
\<br>
-plugins to configure network interfaces in Linux containers, along with a =
\<br>
-number of supported plugins. CNI concerns itself only with network connect=
ivity \<br>
-of containers and removing allocated resources when the container is delet=
ed. \<br>
-Because of this focus, CNI has a wide range of support and the specificati=
on \<br>
-is simple to implement. \<br>
-&quot;<br>
+# This cni version is supposed to track latest upstream.<br>
+require cni.inc<br>
<br>
=C2=A0SRCREV_cni =3D &quot;dc71cd2ba60c452c56a0a259f2a23d2afe42b688&quot;<b=
r>
=C2=A0SRCREV_plugins =3D &quot;0eddc554c0747200b7b112ce5322dcfa525298cf&quo=
t;<br>
@@ -15,65 +7,4 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/containernet=
working/cni.git;nobranch=3D1;name=3Dcni" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni.git;nobranch=3D1;name=3Dcni</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/contai=
nernetworking/plugins.git;nobranch=3D1;destsuffix=3Dplugins;name=3Dplugins"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugin=
s.git;nobranch=3D1;destsuffix=3Dplugins;name=3Dplugins</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-RPROVIDES_${PN} +=3D &quot;kubernetes-cni&quot;<br>
-<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3Dfa818a259cbed7c=
e8bc2a22d35a464fc&quot;<br>
-<br>
-GO_IMPORT =3D &quot;import&quot;<br>
-<br>
=C2=A0PV =3D &quot;0.7.0+git${SRCREV_cni}&quot;<br>
-<br>
-inherit go<br>
-inherit goarch<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# link fixups for compilation<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/import/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/src/import/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/src/import/plugins<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/src/import/vendor/<a href=3D"http:/=
/github.com/containernetworking/plugins" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/plugins</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<a href=3D"http=
://github.com/containernetworking/cni" rel=3D"noreferrer" target=3D"_blank"=
>github.com/containernetworking/cni</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../libcni ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/cni/libcni" rel=3D"noref=
errer" target=3D"_blank">github.com/containernetworking/cni/libcni</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../pkg ${S}/src/import/vendor/<=
a href=3D"http://github.com/containernetworking/cni/pkg" rel=3D"noreferrer"=
 target=3D"_blank">github.com/containernetworking/cni/pkg</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../cnitool ${S}/src/import/vend=
or/<a href=3D"http://github.com/containernetworking/cni/cnitool" rel=3D"nor=
eferrer" target=3D"_blank">github.com/containernetworking/cni/cnitool</a><b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${WORKDIR}/plugins ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/plugins" rel=3D"noreferr=
er" target=3D"_blank">github.com/containernetworking/plugins</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/libcni" rel=3D"noreferrer" target=3D"_blank=
">github.com/containernetworking/cni/libcni</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/cnitool" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni/cnitool</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/plugins/" rel=3D"noreferrer" target=3D"_blank">=
github.com/containernetworking/plugins/</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PLUGINS=3D&quot;$(ls -d plugins/meta/*; ls -d p=
lugins/ipam/*; ls -d plugins/main/* | grep -v windows)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/plugins/bin/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for p in $PLUGINS; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugin=3D&quot;$(basename &quot;$=
p&quot;)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;building: $p&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build -o ${WORKDIR}/plugins=
/bin/$plugin <a href=3D"http://github.com/containernetworking/plugins/$p" r=
el=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugins/=
$p</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 localbindir=3D&quot;/opt/cni/bin&quot;<br>
-<br>
-=C2=A0 =C2=A0 install -d ${D}${localbindir}<br>
-=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/cni/net.d<br>
-<br>
-=C2=A0 =C2=A0 install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localb=
indir}<br>
-=C2=A0 =C2=A0 install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindi=
r}<br>
-}<br>
-<br>
-FILES_${PN} +=3D &quot;/opt/cni/bin/*&quot;<br>
-<br>
-INSANE_SKIP_${PN} +=3D &quot;ldflags already-stripped&quot;<br>
-<br>
-deltask compile_ptest_base<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000a9d09a058ffeddd3--
