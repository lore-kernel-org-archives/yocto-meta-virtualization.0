Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73F40E00D8F; Tue, 13 Aug 2019 18:28:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84C08E0082A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 18:28:30 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7E1STwI021064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 18:28:29 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 13 Aug 2019 18:28:28 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<CADkTA4OM9sYbf-dZnXs0A4-Efjg9bj3MbPar9bS=3W8eDEiBhA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ed258dd7-e3bb-4b87-e598-be38917c1762@windriver.com>
Date: Wed, 14 Aug 2019 09:41:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OM9sYbf-dZnXs0A4-Efjg9bj3MbPar9bS=3W8eDEiBhA@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/4] cni: add 0.7.1 for cni and 0.7.5 for plugins
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
X-List-Received-Date: Wed, 14 Aug 2019 01:28:31 -0000
Content-Type: multipart/alternative;
	boundary="------------94173BB3B2C0DD333E718593"

--------------94173BB3B2C0DD333E718593
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2019 08:31 PM, Bruce Ashfield wrote:
>
>
> On Tue, Aug 13, 2019 at 3:52 AM Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     This version is proved to work well for simple k8s flannel setup.
>
>
> Nope. We have no reason to use version locked recipes for this. I want 
> one version for the layer, not a _git and a versioned set of plugins.
>
> Upgrade the main _cni plugin to the latest version, make sure it works 
> with kubernetes and that's the version we'll use.
>

I've replied in another email what problem is with the current version 
of  cni. Hope you can reproduce it on your side.

Apart form this, I have several questions, and I hope to hear your opinion.

1. Docker version with k8s
     I've seen warnings from k8s telling me that the current docker 
version is not supported/validated upstream. Do you think it's a 
problem? From what I know, k8s team is not very interested in validating 
latest docker.

2. Docker upstream
     We are currently using moby. There's another recipe called 
docker-ce, making use of docker-ce repo. Ubuntu is using docker-ce. I 
did a little investigation. Moby is actually the community version while 
docker-ce is maintained by Docker Inc. Do you think we should do 
something about it? Which one should we prefer? moby or docker-ce?

3. k8s version
     The current version is not the latest stable version (1.15.2). I 
hope this 1.16 version would come be released stable, but we cannot 
control it. Do you think we should have a stable version of k8s?

 From what I know, OE's policy is using stable version unless there's 
some compelling reason. All these container/k8s things are being 
actively developed, and that could be a reason. But should we also have 
some stable versions? I don't think users would like to use unstable 
version in their production environment.

Best Regards,
Chen Qi


> Cheers,
>
> Bruce
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      recipes-networking/cni/cni_0.7.1.bb <http://cni_0.7.1.bb> | 79
>     +++++++++++++++++++++++++++++
>      1 file changed, 79 insertions(+)
>      create mode 100644 recipes-networking/cni/cni_0.7.1.bb
>     <http://cni_0.7.1.bb>
>
>     diff --git a/recipes-networking/cni/cni_0.7.1.bb
>     <http://cni_0.7.1.bb> b/recipes-networking/cni/cni_0.7.1.bb
>     <http://cni_0.7.1.bb>
>     new file mode 100644
>     index 0000000..7a3b87f
>     --- /dev/null
>     +++ b/recipes-networking/cni/cni_0.7.1.bb <http://cni_0.7.1.bb>
>     @@ -0,0 +1,79 @@
>     +HOMEPAGE = "https://github.com/containernetworking/cni"
>     +SUMMARY = "Container Network Interface - networking for Linux
>     containers"
>     +DESCRIPTION = "CNI (Container Network Interface), a Cloud Native
>     Computing \
>     +Foundation project, consists of a specification and libraries for
>     writing \
>     +plugins to configure network interfaces in Linux containers,
>     along with a \
>     +number of supported plugins. CNI concerns itself only with
>     network connectivity \
>     +of containers and removing allocated resources when the container
>     is deleted. \
>     +Because of this focus, CNI has a wide range of support and the
>     specification \
>     +is simple to implement. \
>     +"
>     +
>     +# 0.7.1
>     +SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
>     +# 0.7.5
>     +SRCREV_plugins = "a62711a5da7a2dc2eb93eac47e103738ad923fd6"
>     +SRC_URI = "\
>     +     
>      git://github.com/containernetworking/cni.git;branch=master;name=cni
>     <http://github.com/containernetworking/cni.git;branch=master;name=cni>
>     \
>     +       
>     git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins
>     <http://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins>
>     \
>     +       "
>     +
>     +RPROVIDES_${PN} += "kubernetes-cni"
>     +
>     +LICENSE = "Apache-2.0"
>     +LIC_FILES_CHKSUM =
>     "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>     +
>     +GO_IMPORT = "import"
>     +
>     +PV = "0.7.1"
>     +
>     +inherit go
>     +inherit goarch
>     +
>     +do_compile() {
>     +       # link fixups for compilation
>     +       rm -f ${S}/src/import/vendor/src
>     +       mkdir -p ${S}/src/import/vendor/
>     +       ln -sf ./ ${S}/src/import/vendor/src
>     +       rm -rf ${S}/src/import/plugins
>     +       rm -rf
>     ${S}/src/import/vendor/github.com/containernetworking/plugins
>     <http://github.com/containernetworking/plugins>
>     +
>     +       mkdir -p
>     ${S}/src/import/vendor/github.com/containernetworking/cni
>     <http://github.com/containernetworking/cni>
>     +
>     +       ln -sf ../../../../libcni
>     ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>     <http://github.com/containernetworking/cni/libcni>
>     +       ln -sf ../../../../pkg
>     ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
>     <http://github.com/containernetworking/cni/pkg>
>     +       ln -sf ../../../../cnitool
>     ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>     <http://github.com/containernetworking/cni/cnitool>
>     +       ln -sf ${WORKDIR}/plugins
>     ${S}/src/import/vendor/github.com/containernetworking/plugins
>     <http://github.com/containernetworking/plugins>
>     +
>     +       export
>     GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>     +       export CGO_ENABLED="1"
>     +
>     +       cd
>     ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>     <http://github.com/containernetworking/cni/libcni>
>     +       ${GO} build
>     +
>     +       cd
>     ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>     <http://github.com/containernetworking/cni/cnitool>
>     +       ${GO} build
>     +
>     +       cd
>     ${S}/src/import/vendor/github.com/containernetworking/plugins/
>     <http://github.com/containernetworking/plugins/>
>     +       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls
>     -d plugins/main/* | grep -v windows)"
>     +       mkdir -p ${WORKDIR}/plugins/bin/
>     +       for p in $PLUGINS; do
>     +           plugin="$(basename "$p")"
>     +           echo "building: $p"
>     +           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
>     github.com/containernetworking/plugins/$p
>     <http://github.com/containernetworking/plugins/$p>
>     +       done
>     +}
>     +
>     +do_install() {
>     +    localbindir="/opt/cni/bin"
>     +
>     +    install -d ${D}${localbindir}
>     +    install -d ${D}/${sysconfdir}/cni/net.d
>     +
>     +    install -m 755 ${S}/src/import/cnitool/cnitool
>     ${D}/${localbindir}
>     +    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>     +}
>     +
>     +FILES_${PN} += "/opt/cni/bin/*"
>     +
>     +INSANE_SKIP_${PN} += "ldflags already-stripped"
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--------------94173BB3B2C0DD333E718593
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/13/2019 08:31 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4OM9sYbf-dZnXs0A4-Efjg9bj3MbPar9bS=3W8eDEiBhA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Aug 13, 2019 at 3:52
            AM Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">This version is proved to
            work well for simple k8s flannel setup.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">Nope. We
              have no reason to use version locked recipes for this. I
              want one version for the layer, not a _git and a versioned
              set of plugins.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Upgrade
              the main _cni plugin to the latest version, make sure it
              works with kubernetes and that's the version we'll use.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I've replied in another email what problem is with the current
    version of  cni. Hope you can reproduce it on your side.<br>
    <br>
    Apart form this, I have several questions, and I hope to hear your
    opinion.<br>
    <br>
    1. Docker version with k8s<br>
        I've seen warnings from k8s telling me that the current docker
    version is not supported/validated upstream. Do you think it's a
    problem? From what I know, k8s team is not very interested in
    validating latest docker.<br>
    <br>
    2. Docker upstream<br>
        We are currently using moby. There's another recipe called
    docker-ce, making use of docker-ce repo. Ubuntu is using docker-ce.
    I did a little investigation. Moby is actually the community version
    while docker-ce is maintained by Docker Inc. Do you think we should
    do something about it? Which one should we prefer? moby or
    docker-ce?<br>
    <br>
    3. k8s version<br>
        The current version is not the latest stable version (1.15.2). I
    hope this 1.16 version would come be released stable, but we cannot
    control it. Do you think we should have a stable version of k8s?<br>
    <br>
    From what I know, OE's policy is using stable version unless there's
    some compelling reason. All these container/k8s things are being
    actively developed, and that could be a reason. But should we also
    have some stable versions? I don't think users would like to use
    unstable version in their production environment.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <br>
    <blockquote
cite="mid:CADkTA4OM9sYbf-dZnXs0A4-Efjg9bj3MbPar9bS=3W8eDEiBhA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small">Cheers,</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a> | 79
            +++++++++++++++++++++++++++++<br>
             1 file changed, 79 insertions(+)<br>
             create mode 100644 recipes-networking/cni/<a
              moz-do-not-send="true" href="http://cni_0.7.1.bb"
              rel="noreferrer" target="_blank">cni_0.7.1.bb</a><br>
            <br>
            diff --git a/recipes-networking/cni/<a
              moz-do-not-send="true" href="http://cni_0.7.1.bb"
              rel="noreferrer" target="_blank">cni_0.7.1.bb</a>
            b/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a><br>
            new file mode 100644<br>
            index 0000000..7a3b87f<br>
            --- /dev/null<br>
            +++ b/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a><br>
            @@ -0,0 +1,79 @@<br>
            +HOMEPAGE = "<a moz-do-not-send="true"
              href="https://github.com/containernetworking/cni"
              rel="noreferrer" target="_blank">https://github.com/containernetworking/cni</a>"<br>
            +SUMMARY = "Container Network Interface - networking for
            Linux containers"<br>
            +DESCRIPTION = "CNI (Container Network Interface), a Cloud
            Native Computing \<br>
            +Foundation project, consists of a specification and
            libraries for writing \<br>
            +plugins to configure network interfaces in Linux
            containers, along with a \<br>
            +number of supported plugins. CNI concerns itself only with
            network connectivity \<br>
            +of containers and removing allocated resources when the
            container is deleted. \<br>
            +Because of this focus, CNI has a wide range of support and
            the specification \<br>
            +is simple to implement. \<br>
            +"<br>
            +<br>
            +# 0.7.1<br>
            +SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"<br>
            +# 0.7.5<br>
            +SRCREV_plugins = "a62711a5da7a2dc2eb93eac47e103738ad923fd6"<br>
            +SRC_URI = "\<br>
            +       git://<a moz-do-not-send="true"
href="http://github.com/containernetworking/cni.git;branch=master;name=cni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni.git;branch=master;name=cni</a>
            \<br>
            +        git://<a moz-do-not-send="true"
href="http://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins</a>
            \<br>
            +       "<br>
            +<br>
            +RPROVIDES_${PN} += "kubernetes-cni"<br>
            +<br>
            +LICENSE = "Apache-2.0"<br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc">"file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"</a><br>
            +<br>
            +GO_IMPORT = "import"<br>
            +<br>
            +PV = "0.7.1"<br>
            +<br>
            +inherit go<br>
            +inherit goarch<br>
            +<br>
            +do_compile() {<br>
            +       # link fixups for compilation<br>
            +       rm -f ${S}/src/import/vendor/src<br>
            +       mkdir -p ${S}/src/import/vendor/<br>
            +       ln -sf ./ ${S}/src/import/vendor/src<br>
            +       rm -rf ${S}/src/import/plugins<br>
            +       rm -rf ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins</a><br>
            +<br>
            +       mkdir -p ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni</a><br>
            +<br>
            +       ln -sf ../../../../libcni ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/libcni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/libcni</a><br>
            +       ln -sf ../../../../pkg ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/pkg"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/pkg</a><br>
            +       ln -sf ../../../../cnitool ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/cnitool"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/cnitool</a><br>
            +       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins</a><br>
            +<br>
            +       export
GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"<br>
            +       export CGO_ENABLED="1"<br>
            +<br>
            +       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/libcni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/libcni</a><br>
            +       ${GO} build<br>
            +<br>
            +       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/cnitool"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/cnitool</a><br>
            +       ${GO} build<br>
            +<br>
            +       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins/"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins/</a><br>
            +       PLUGINS="$(ls -d plugins/meta/*; ls -d
            plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"<br>
            +       mkdir -p ${WORKDIR}/plugins/bin/<br>
            +       for p in $PLUGINS; do<br>
            +           plugin="$(basename "$p")"<br>
            +           echo "building: $p"<br>
            +           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin <a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins/$p"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins/$p</a><br>
            +       done<br>
            +}<br>
            +<br>
            +do_install() {<br>
            +    localbindir="/opt/cni/bin"<br>
            +<br>
            +    install -d ${D}${localbindir}<br>
            +    install -d ${D}/${sysconfdir}/cni/net.d<br>
            +<br>
            +    install -m 755 ${S}/src/import/cnitool/cnitool
            ${D}/${localbindir}<br>
            +    install -m 755 -D ${WORKDIR}/plugins/bin/*
            ${D}/${localbindir}<br>
            +}<br>
            +<br>
            +FILES_${PN} += "/opt/cni/bin/*"<br>
            +<br>
            +INSANE_SKIP_${PN} += "ldflags already-stripped"<br>
            -- <br>
            2.17.1<br>
            <br>
            -- <br>
            _______________________________________________<br>
            meta-virtualization mailing list<br>
            <a moz-do-not-send="true"
              href="mailto:meta-virtualization@yoctoproject.org"
              target="_blank">meta-virtualization@yoctoproject.org</a><br>
            <a moz-do-not-send="true"
              href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
              rel="noreferrer" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------94173BB3B2C0DD333E718593--
