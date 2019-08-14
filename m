Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02AEEE00C78; Tue, 13 Aug 2019 18:09:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F08EAE0049C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 18:09:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7E18tbI019735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 18:09:16 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 13 Aug 2019 18:09:06 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<20190813075136.6248-2-Qi.Chen@windriver.com>
	<CADkTA4Oy9bXZ7AVshwBPAf1C+t9HecLpywV=3pG0EX7qU1c8LA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <7c20f5c5-1e06-e4f7-3418-639404431a73@windriver.com>
Date: Wed, 14 Aug 2019 09:22:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Oy9bXZ7AVshwBPAf1C+t9HecLpywV=3pG0EX7qU1c8LA@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
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
X-List-Received-Date: Wed, 14 Aug 2019 01:09:46 -0000
Content-Type: multipart/alternative;
	boundary="------------1DBC9F820A45EA6B8EFA6BFD"

--------------1DBC9F820A45EA6B8EFA6BFD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2019 08:34 PM, Bruce Ashfield wrote:
>
>
> On Tue, Aug 13, 2019 at 3:52 AM Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Extract common settings of two cni recipe into cni.inc.
>     Add comment in recipe file to explicitly state what the version is
>     for.
>     More sepcifically, the git version is used to track latest upstream,
>     while the 0.7.1 version is used to ensure basic setup works for k8s.
>
>
> As I mentioned, we won't do this. It doubles the maintenance and shows 
> a fundamental API / ABI incompatibility if we can't use the different 
> versions against a released k8s.
>
> There is one version of the recipe, and I've always had it working for 
> the released kubernetes and master. I'm not seeing any issues with the 
> latest and my k8s configs, so I'm not sure what you are running into 
> that I'm not.
>
> Bruce
>

I've filed an issue for upstream. 
https://github.com/containernetworking/plugins/issues/370#issuecomment-520718048
Please check it.

How do you setup you k8s cluster? Are you using flannel?
I can confirm that the current versions in meta-virtualization would 
result in "failed to create bridge "cni0": could not add "cni0": 
operation not supported" error. This can be reproduced on both virtual 
machines and physical machines.

Execute the following commands on target, and you should see the coredns 
is not running, and when describing the pod, you see the failure.
swapoff -a
kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f 
https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

Please help double check if this could be reproduced on your side.

Best Regards,
Chen Qi

>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      recipes-networking/cni/cni.inc      | 79
>     +++++++++++++++++++++++++++++
>      recipes-networking/cni/cni_0.7.1.bb <http://cni_0.7.1.bb> | 71
>     +-------------------------
>      recipes-networking/cni/cni_git.bb <http://cni_git.bb>  | 73
>     +-------------------------
>      3 files changed, 83 insertions(+), 140 deletions(-)
>      create mode 100644 recipes-networking/cni/cni.inc
>
>     diff --git a/recipes-networking/cni/cni.inc
>     b/recipes-networking/cni/cni.inc
>     new file mode 100644
>     index 0000000..7a3b87f
>     --- /dev/null
>     +++ b/recipes-networking/cni/cni.inc
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
>     diff --git a/recipes-networking/cni/cni_0.7.1.bb
>     <http://cni_0.7.1.bb> b/recipes-networking/cni/cni_0.7.1.bb
>     <http://cni_0.7.1.bb>
>     index 7a3b87f..7977040 100644
>     --- a/recipes-networking/cni/cni_0.7.1.bb <http://cni_0.7.1.bb>
>     +++ b/recipes-networking/cni/cni_0.7.1.bb <http://cni_0.7.1.bb>
>     @@ -1,13 +1,5 @@
>     -HOMEPAGE = "https://github.com/containernetworking/cni"
>     -SUMMARY = "Container Network Interface - networking for Linux
>     containers"
>     -DESCRIPTION = "CNI (Container Network Interface), a Cloud Native
>     Computing \
>     -Foundation project, consists of a specification and libraries for
>     writing \
>     -plugins to configure network interfaces in Linux containers,
>     along with a \
>     -number of supported plugins. CNI concerns itself only with
>     network connectivity \
>     -of containers and removing allocated resources when the container
>     is deleted. \
>     -Because of this focus, CNI has a wide range of support and the
>     specification \
>     -is simple to implement. \
>     -"
>     +# This cni version is here to ensure that basic k8s setup with
>     flannel could work.
>     +require cni.inc
>
>      # 0.7.1
>      SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
>     @@ -17,63 +9,4 @@ SRC_URI = "\
>            
>     git://github.com/containernetworking/cni.git;branch=master;name=cni
>     <http://github.com/containernetworking/cni.git;branch=master;name=cni>
>     \
>            
>      git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins
>     <http://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins>
>     \
>             "
>     -
>     -RPROVIDES_${PN} += "kubernetes-cni"
>     -
>     -LICENSE = "Apache-2.0"
>     -LIC_FILES_CHKSUM =
>     "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>     -
>     -GO_IMPORT = "import"
>     -
>      PV = "0.7.1"
>     -
>     -inherit go
>     -inherit goarch
>     -
>     -do_compile() {
>     -       # link fixups for compilation
>     -       rm -f ${S}/src/import/vendor/src
>     -       mkdir -p ${S}/src/import/vendor/
>     -       ln -sf ./ ${S}/src/import/vendor/src
>     -       rm -rf ${S}/src/import/plugins
>     -       rm -rf
>     ${S}/src/import/vendor/github.com/containernetworking/plugins
>     <http://github.com/containernetworking/plugins>
>     -
>     -       mkdir -p
>     ${S}/src/import/vendor/github.com/containernetworking/cni
>     <http://github.com/containernetworking/cni>
>     -
>     -       ln -sf ../../../../libcni
>     ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>     <http://github.com/containernetworking/cni/libcni>
>     -       ln -sf ../../../../pkg
>     ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
>     <http://github.com/containernetworking/cni/pkg>
>     -       ln -sf ../../../../cnitool
>     ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>     <http://github.com/containernetworking/cni/cnitool>
>     -       ln -sf ${WORKDIR}/plugins
>     ${S}/src/import/vendor/github.com/containernetworking/plugins
>     <http://github.com/containernetworking/plugins>
>     -
>     -       export
>     GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>     -       export CGO_ENABLED="1"
>     -
>     -       cd
>     ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>     <http://github.com/containernetworking/cni/libcni>
>     -       ${GO} build
>     -
>     -       cd
>     ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>     <http://github.com/containernetworking/cni/cnitool>
>     -       ${GO} build
>     -
>     -       cd
>     ${S}/src/import/vendor/github.com/containernetworking/plugins/
>     <http://github.com/containernetworking/plugins/>
>     -       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls
>     -d plugins/main/* | grep -v windows)"
>     -       mkdir -p ${WORKDIR}/plugins/bin/
>     -       for p in $PLUGINS; do
>     -           plugin="$(basename "$p")"
>     -           echo "building: $p"
>     -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
>     github.com/containernetworking/plugins/$p
>     <http://github.com/containernetworking/plugins/$p>
>     -       done
>     -}
>     -
>     -do_install() {
>     -    localbindir="/opt/cni/bin"
>     -
>     -    install -d ${D}${localbindir}
>     -    install -d ${D}/${sysconfdir}/cni/net.d
>     -
>     -    install -m 755 ${S}/src/import/cnitool/cnitool
>     ${D}/${localbindir}
>     -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>     -}
>     -
>     -FILES_${PN} += "/opt/cni/bin/*"
>     -
>     -INSANE_SKIP_${PN} += "ldflags already-stripped"
>     diff --git a/recipes-networking/cni/cni_git.bb <http://cni_git.bb>
>     b/recipes-networking/cni/cni_git.bb <http://cni_git.bb>
>     index 5348b95..06b37a4 100644
>     --- a/recipes-networking/cni/cni_git.bb <http://cni_git.bb>
>     +++ b/recipes-networking/cni/cni_git.bb <http://cni_git.bb>
>     @@ -1,13 +1,5 @@
>     -HOMEPAGE = "https://github.com/containernetworking/cni"
>     -SUMMARY = "Container Network Interface - networking for Linux
>     containers"
>     -DESCRIPTION = "CNI (Container Network Interface), a Cloud Native
>     Computing \
>     -Foundation project, consists of a specification and libraries for
>     writing \
>     -plugins to configure network interfaces in Linux containers,
>     along with a \
>     -number of supported plugins. CNI concerns itself only with
>     network connectivity \
>     -of containers and removing allocated resources when the container
>     is deleted. \
>     -Because of this focus, CNI has a wide range of support and the
>     specification \
>     -is simple to implement. \
>     -"
>     +# This cni version is supposed to track latest upstream.
>     +require cni.inc
>
>      SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
>      SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
>     @@ -15,65 +7,4 @@ SRC_URI = "\
>            
>     git://github.com/containernetworking/cni.git;nobranch=1;name=cni
>     <http://github.com/containernetworking/cni.git;nobranch=1;name=cni> \
>            
>      git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins
>     <http://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins>
>     \
>             "
>     -
>     -RPROVIDES_${PN} += "kubernetes-cni"
>     -
>     -LICENSE = "Apache-2.0"
>     -LIC_FILES_CHKSUM =
>     "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>     -
>     -GO_IMPORT = "import"
>     -
>      PV = "0.7.0+git${SRCREV_cni}"
>     -
>     -inherit go
>     -inherit goarch
>     -
>     -do_compile() {
>     -       # link fixups for compilation
>     -       rm -f ${S}/src/import/vendor/src
>     -       mkdir -p ${S}/src/import/vendor/
>     -       ln -sf ./ ${S}/src/import/vendor/src
>     -       rm -rf ${S}/src/import/plugins
>     -       rm -rf
>     ${S}/src/import/vendor/github.com/containernetworking/plugins
>     <http://github.com/containernetworking/plugins>
>     -
>     -       mkdir -p
>     ${S}/src/import/vendor/github.com/containernetworking/cni
>     <http://github.com/containernetworking/cni>
>     -
>     -       ln -sf ../../../../libcni
>     ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>     <http://github.com/containernetworking/cni/libcni>
>     -       ln -sf ../../../../pkg
>     ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
>     <http://github.com/containernetworking/cni/pkg>
>     -       ln -sf ../../../../cnitool
>     ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>     <http://github.com/containernetworking/cni/cnitool>
>     -       ln -sf ${WORKDIR}/plugins
>     ${S}/src/import/vendor/github.com/containernetworking/plugins
>     <http://github.com/containernetworking/plugins>
>     -
>     -       export
>     GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>     -       export CGO_ENABLED="1"
>     -
>     -       cd
>     ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>     <http://github.com/containernetworking/cni/libcni>
>     -       ${GO} build
>     -
>     -       cd
>     ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>     <http://github.com/containernetworking/cni/cnitool>
>     -       ${GO} build
>     -
>     -       cd
>     ${S}/src/import/vendor/github.com/containernetworking/plugins/
>     <http://github.com/containernetworking/plugins/>
>     -       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls
>     -d plugins/main/* | grep -v windows)"
>     -       mkdir -p ${WORKDIR}/plugins/bin/
>     -       for p in $PLUGINS; do
>     -           plugin="$(basename "$p")"
>     -           echo "building: $p"
>     -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
>     github.com/containernetworking/plugins/$p
>     <http://github.com/containernetworking/plugins/$p>
>     -       done
>     -}
>     -
>     -do_install() {
>     -    localbindir="/opt/cni/bin"
>     -
>     -    install -d ${D}${localbindir}
>     -    install -d ${D}/${sysconfdir}/cni/net.d
>     -
>     -    install -m 755 ${S}/src/import/cnitool/cnitool
>     ${D}/${localbindir}
>     -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>     -}
>     -
>     -FILES_${PN} += "/opt/cni/bin/*"
>     -
>     -INSANE_SKIP_${PN} += "ldflags already-stripped"
>     -
>     -deltask compile_ptest_base
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


--------------1DBC9F820A45EA6B8EFA6BFD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/13/2019 08:34 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4Oy9bXZ7AVshwBPAf1C+t9HecLpywV=3pG0EX7qU1c8LA@mail.gmail.com"
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
            rgb(204,204,204);padding-left:1ex">Extract common settings
            of two cni recipe into cni.inc.<br>
            Add comment in recipe file to explicitly state what the
            version is for.<br>
            More sepcifically, the git version is used to track latest
            upstream,<br>
            while the 0.7.1 version is used to ensure basic setup works
            for k8s.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">As I
              mentioned, we won't do this. It doubles the maintenance
              and shows a fundamental API / ABI incompatibility if we
              can't use the different versions against a released k8s.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">There is
              one version of the recipe, and I've always had it working
              for the released kubernetes and master. I'm not seeing any
              issues with the latest and my k8s configs, so I'm not sure
              what you are running into that I'm not.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I've filed an issue for upstream.
<a class="moz-txt-link-freetext" href="https://github.com/containernetworking/plugins/issues/370#issuecomment-520718048">https://github.com/containernetworking/plugins/issues/370#issuecomment-520718048</a><br>
    Please check it.<br>
    <br>
    How do you setup you k8s cluster? Are you using flannel?<br>
    I can confirm that the current versions in meta-virtualization would
    result in "failed to create bridge "cni0": could not add "cni0":
    operation not supported" error. This can be reproduced on both
    virtual machines and physical machines.<br>
    <br>
    Execute the following commands on target, and you should see the
    coredns is not running, and when describing the pod, you see the
    failure.<br>
    swapoff -a<br>
    kubeadm init --pod-network-cidr=10.244.0.0/16<br>
    mkdir -p $HOME/.kube<br>
    cp -i /etc/kubernetes/admin.conf $HOME/.kube/config<br>
    chown $(id -u):$(id -g) $HOME/.kube/config<br>
    kubectl apply -f
<a class="moz-txt-link-freetext" href="https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml">https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml</a><br>
    <br>
    Please help double check if this could be reproduced on your side.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CADkTA4Oy9bXZ7AVshwBPAf1C+t9HecLpywV=3pG0EX7qU1c8LA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             recipes-networking/cni/cni.inc      | 79
            +++++++++++++++++++++++++++++<br>
             recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a> | 71
            +-------------------------<br>
             recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_git.bb" rel="noreferrer" target="_blank">cni_git.bb</a> 
             | 73 +-------------------------<br>
             3 files changed, 83 insertions(+), 140 deletions(-)<br>
             create mode 100644 recipes-networking/cni/cni.inc<br>
            <br>
            diff --git a/recipes-networking/cni/cni.inc
            b/recipes-networking/cni/cni.inc<br>
            new file mode 100644<br>
            index 0000000..7a3b87f<br>
            --- /dev/null<br>
            +++ b/recipes-networking/cni/cni.inc<br>
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
            diff --git a/recipes-networking/cni/<a
              moz-do-not-send="true" href="http://cni_0.7.1.bb"
              rel="noreferrer" target="_blank">cni_0.7.1.bb</a>
            b/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a><br>
            index 7a3b87f..7977040 100644<br>
            --- a/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a><br>
            +++ b/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_0.7.1.bb" rel="noreferrer"
              target="_blank">cni_0.7.1.bb</a><br>
            @@ -1,13 +1,5 @@<br>
            -HOMEPAGE = "<a moz-do-not-send="true"
              href="https://github.com/containernetworking/cni"
              rel="noreferrer" target="_blank">https://github.com/containernetworking/cni</a>"<br>
            -SUMMARY = "Container Network Interface - networking for
            Linux containers"<br>
            -DESCRIPTION = "CNI (Container Network Interface), a Cloud
            Native Computing \<br>
            -Foundation project, consists of a specification and
            libraries for writing \<br>
            -plugins to configure network interfaces in Linux
            containers, along with a \<br>
            -number of supported plugins. CNI concerns itself only with
            network connectivity \<br>
            -of containers and removing allocated resources when the
            container is deleted. \<br>
            -Because of this focus, CNI has a wide range of support and
            the specification \<br>
            -is simple to implement. \<br>
            -"<br>
            +# This cni version is here to ensure that basic k8s setup
            with flannel could work.<br>
            +require cni.inc<br>
            <br>
             # 0.7.1<br>
             SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"<br>
            @@ -17,63 +9,4 @@ SRC_URI = "\<br>
                    git://<a moz-do-not-send="true"
href="http://github.com/containernetworking/cni.git;branch=master;name=cni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni.git;branch=master;name=cni</a>
            \<br>
                     git://<a moz-do-not-send="true"
href="http://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins</a>
            \<br>
                    "<br>
            -<br>
            -RPROVIDES_${PN} += "kubernetes-cni"<br>
            -<br>
            -LICENSE = "Apache-2.0"<br>
            -LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc">"file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"</a><br>
            -<br>
            -GO_IMPORT = "import"<br>
            -<br>
             PV = "0.7.1"<br>
            -<br>
            -inherit go<br>
            -inherit goarch<br>
            -<br>
            -do_compile() {<br>
            -       # link fixups for compilation<br>
            -       rm -f ${S}/src/import/vendor/src<br>
            -       mkdir -p ${S}/src/import/vendor/<br>
            -       ln -sf ./ ${S}/src/import/vendor/src<br>
            -       rm -rf ${S}/src/import/plugins<br>
            -       rm -rf ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins</a><br>
            -<br>
            -       mkdir -p ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni</a><br>
            -<br>
            -       ln -sf ../../../../libcni ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/libcni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/libcni</a><br>
            -       ln -sf ../../../../pkg ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/pkg"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/pkg</a><br>
            -       ln -sf ../../../../cnitool ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/cnitool"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/cnitool</a><br>
            -       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins</a><br>
            -<br>
            -       export
GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"<br>
            -       export CGO_ENABLED="1"<br>
            -<br>
            -       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/libcni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/libcni</a><br>
            -       ${GO} build<br>
            -<br>
            -       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/cnitool"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/cnitool</a><br>
            -       ${GO} build<br>
            -<br>
            -       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins/"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins/</a><br>
            -       PLUGINS="$(ls -d plugins/meta/*; ls -d
            plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"<br>
            -       mkdir -p ${WORKDIR}/plugins/bin/<br>
            -       for p in $PLUGINS; do<br>
            -           plugin="$(basename "$p")"<br>
            -           echo "building: $p"<br>
            -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin <a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins/$p"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins/$p</a><br>
            -       done<br>
            -}<br>
            -<br>
            -do_install() {<br>
            -    localbindir="/opt/cni/bin"<br>
            -<br>
            -    install -d ${D}${localbindir}<br>
            -    install -d ${D}/${sysconfdir}/cni/net.d<br>
            -<br>
            -    install -m 755 ${S}/src/import/cnitool/cnitool
            ${D}/${localbindir}<br>
            -    install -m 755 -D ${WORKDIR}/plugins/bin/*
            ${D}/${localbindir}<br>
            -}<br>
            -<br>
            -FILES_${PN} += "/opt/cni/bin/*"<br>
            -<br>
            -INSANE_SKIP_${PN} += "ldflags already-stripped"<br>
            diff --git a/recipes-networking/cni/<a
              moz-do-not-send="true" href="http://cni_git.bb"
              rel="noreferrer" target="_blank">cni_git.bb</a>
            b/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_git.bb" rel="noreferrer" target="_blank">cni_git.bb</a><br>
            index 5348b95..06b37a4 100644<br>
            --- a/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_git.bb" rel="noreferrer" target="_blank">cni_git.bb</a><br>
            +++ b/recipes-networking/cni/<a moz-do-not-send="true"
              href="http://cni_git.bb" rel="noreferrer" target="_blank">cni_git.bb</a><br>
            @@ -1,13 +1,5 @@<br>
            -HOMEPAGE = "<a moz-do-not-send="true"
              href="https://github.com/containernetworking/cni"
              rel="noreferrer" target="_blank">https://github.com/containernetworking/cni</a>"<br>
            -SUMMARY = "Container Network Interface - networking for
            Linux containers"<br>
            -DESCRIPTION = "CNI (Container Network Interface), a Cloud
            Native Computing \<br>
            -Foundation project, consists of a specification and
            libraries for writing \<br>
            -plugins to configure network interfaces in Linux
            containers, along with a \<br>
            -number of supported plugins. CNI concerns itself only with
            network connectivity \<br>
            -of containers and removing allocated resources when the
            container is deleted. \<br>
            -Because of this focus, CNI has a wide range of support and
            the specification \<br>
            -is simple to implement. \<br>
            -"<br>
            +# This cni version is supposed to track latest upstream.<br>
            +require cni.inc<br>
            <br>
             SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"<br>
             SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"<br>
            @@ -15,65 +7,4 @@ SRC_URI = "\<br>
                    git://<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni.git;nobranch=1;name=cni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni.git;nobranch=1;name=cni</a>
            \<br>
                     git://<a moz-do-not-send="true"
href="http://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins</a>
            \<br>
                    "<br>
            -<br>
            -RPROVIDES_${PN} += "kubernetes-cni"<br>
            -<br>
            -LICENSE = "Apache-2.0"<br>
            -LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc">"file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"</a><br>
            -<br>
            -GO_IMPORT = "import"<br>
            -<br>
             PV = "0.7.0+git${SRCREV_cni}"<br>
            -<br>
            -inherit go<br>
            -inherit goarch<br>
            -<br>
            -do_compile() {<br>
            -       # link fixups for compilation<br>
            -       rm -f ${S}/src/import/vendor/src<br>
            -       mkdir -p ${S}/src/import/vendor/<br>
            -       ln -sf ./ ${S}/src/import/vendor/src<br>
            -       rm -rf ${S}/src/import/plugins<br>
            -       rm -rf ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins</a><br>
            -<br>
            -       mkdir -p ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni</a><br>
            -<br>
            -       ln -sf ../../../../libcni ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/libcni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/libcni</a><br>
            -       ln -sf ../../../../pkg ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/pkg"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/pkg</a><br>
            -       ln -sf ../../../../cnitool ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/cnitool"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/cnitool</a><br>
            -       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/<a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins</a><br>
            -<br>
            -       export
GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"<br>
            -       export CGO_ENABLED="1"<br>
            -<br>
            -       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/libcni"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/libcni</a><br>
            -       ${GO} build<br>
            -<br>
            -       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/cni/cnitool"
              rel="noreferrer" target="_blank">github.com/containernetworking/cni/cnitool</a><br>
            -       ${GO} build<br>
            -<br>
            -       cd ${S}/src/import/vendor/<a moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins/"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins/</a><br>
            -       PLUGINS="$(ls -d plugins/meta/*; ls -d
            plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"<br>
            -       mkdir -p ${WORKDIR}/plugins/bin/<br>
            -       for p in $PLUGINS; do<br>
            -           plugin="$(basename "$p")"<br>
            -           echo "building: $p"<br>
            -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin <a
              moz-do-not-send="true"
              href="http://github.com/containernetworking/plugins/$p"
              rel="noreferrer" target="_blank">github.com/containernetworking/plugins/$p</a><br>
            -       done<br>
            -}<br>
            -<br>
            -do_install() {<br>
            -    localbindir="/opt/cni/bin"<br>
            -<br>
            -    install -d ${D}${localbindir}<br>
            -    install -d ${D}/${sysconfdir}/cni/net.d<br>
            -<br>
            -    install -m 755 ${S}/src/import/cnitool/cnitool
            ${D}/${localbindir}<br>
            -    install -m 755 -D ${WORKDIR}/plugins/bin/*
            ${D}/${localbindir}<br>
            -}<br>
            -<br>
            -FILES_${PN} += "/opt/cni/bin/*"<br>
            -<br>
            -INSANE_SKIP_${PN} += "ldflags already-stripped"<br>
            -<br>
            -deltask compile_ptest_base<br>
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

--------------1DBC9F820A45EA6B8EFA6BFD--
