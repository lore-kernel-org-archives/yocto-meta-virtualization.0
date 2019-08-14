Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5BDBE00DA7; Tue, 13 Aug 2019 20:23:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1B25E00D8F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 20:23:43 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id p197so78206619lfa.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 20:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H8vPjvBrTfsCbAPPtkBmASQS4WHRvQnvDVOn2raxeSo=;
	b=XKfRuIftzDtga/WMk38BCuCTuY+Dw3izVQgA2qnuMZdB5Q7stCDcgH761UT5wErbMo
	/PlfZzhzb6aHJDPcOweOXiBxwPmrghoQa4vmsxcNkfS8SaYiHmGZ6gC3HEF1IgeB3kbj
	bJpp7Znfl5LB9SInHU/JMF9kCWxglq8ve05RfuW8awJP31L8iy+aETgQkvgFiGoa6DAL
	fKlJMxj5EWwa/OXW1OWfW+OvmUogSDFG8csL85wirNjZGSqPHMNNDF1akjdZ1+EcMHLk
	r39WcxK/WQjOOrFN4/Gk1LyYmTBQA7HBVFGXf3VOa2XL3p4GgTQ9b+cMSOR+py6koWaA
	30cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H8vPjvBrTfsCbAPPtkBmASQS4WHRvQnvDVOn2raxeSo=;
	b=g3fwrmhh95MNUdRc4oei92bndcpoepy5NTkSdR48YHGpZ/8Z7fzkvdiAlS6bnvGeUo
	46rgEMs6F1u/+JBp/KNlPp2Q108h2bkfxwTHUnrWnUIqoXgGiPDykSrKPnVVpIxbbggH
	dx3oWv1V85bMZdroo6cHpaKYOLZy8/+SE4RY2mRlO0swm/scjf4aKSMHgCpzLNM/tIvM
	GcQsHqLg+8MiRF1qgT2/OZZzjj31fnjNp0ZOazh52IebXYtSml64opRbu84pjuy1B58V
	qr7eXt41Qj8fPoK6pBhyFZ4HKnbsoWiRTxnesJ722iOZitCpnYlLeF9nTBbEFELN5GZT
	b/mA==
X-Gm-Message-State: APjAAAVoYVRhym5lmVikSVUkc2zVxIgsk5P4+xiOge38Wuk0y3+fvUk0
	ShFKYJsfeOBKgy5erA6Fs9Z/qT6zKasLjLJkHT4=
X-Google-Smtp-Source: APXvYqyw4388rZK4N3ucJ4EO87ldbE+Q8VBJ640ZTDrimXmJ7t0kJ3JndEVnXPkAAtPcAtPrVxYNvyetwCCiG+P8UFU=
X-Received: by 2002:a19:4aca:: with SMTP id
	x193mr23794461lfa.146.1565753022658; 
	Tue, 13 Aug 2019 20:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<20190813075136.6248-2-Qi.Chen@windriver.com>
	<CADkTA4Oy9bXZ7AVshwBPAf1C+t9HecLpywV=3pG0EX7qU1c8LA@mail.gmail.com>
	<7c20f5c5-1e06-e4f7-3418-639404431a73@windriver.com>
In-Reply-To: <7c20f5c5-1e06-e4f7-3418-639404431a73@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 23:23:31 -0400
Message-ID: <CADkTA4NAYzRn7VtmZKp2P5mz0AWKhQSwEYRPhaft-p13DLKWew@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Wed, 14 Aug 2019 03:23:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 9:09 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 08/13/2019 08:34 PM, Bruce Ashfield wrote:
>
>
>
> On Tue, Aug 13, 2019 at 3:52 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> Extract common settings of two cni recipe into cni.inc.
>> Add comment in recipe file to explicitly state what the version is for.
>> More sepcifically, the git version is used to track latest upstream,
>> while the 0.7.1 version is used to ensure basic setup works for k8s.
>
>
> As I mentioned, we won't do this. It doubles the maintenance and shows a fundamental API / ABI incompatibility if we can't use the different versions against a released k8s.
>
> There is one version of the recipe, and I've always had it working for the released kubernetes and master. I'm not seeing any issues with the latest and my k8s configs, so I'm not sure what you are running into that I'm not.
>
> Bruce
>
>
> I've filed an issue for upstream. https://github.com/containernetworking/plugins/issues/370#issuecomment-520718048
> Please check it.
>
> How do you setup you k8s cluster? Are you using flannel?

I'm not using flannel for my networking. It is typically weave or some
custom CNI drivers in most of my tests.

> I can confirm that the current versions in meta-virtualization would result in "failed to create bridge "cni0": could not add "cni0": operation not supported" error. This can be reproduced on both virtual machines and physical machines.
>
> Execute the following commands on target, and you should see the coredns is not running, and when describing the pod, you see the failure.
> swapoff -a
> kubeadm init --pod-network-cidr=10.244.0.0/16
> mkdir -p $HOME/.kube
> cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
> chown $(id -u):$(id -g) $HOME/.kube/config
> kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
>
> Please help double check if this could be reproduced on your side.

I won't have time to check this for a few days. I have a lot of
release deliverables to get moved along.

But issues like this are expected, since we are still in a development
cycle. Splitting and maintaining multiple locked version variants of
the recipe is not a good long term strategy. What happens when someone
wants another version. Do we keep three around ? Four ? Who's going to
maintain, bug fix and eventually test/remove them ?

I'd suggest keeping a bbappend with a set SRCREV in your local layer
to not block your development while upstream works through the issue
.. or we debug and try and contribute a fix to the upstream project.

Bruce

>
> Best Regards,
> Chen Qi
>
>
>>
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  recipes-networking/cni/cni.inc      | 79 +++++++++++++++++++++++++++++
>>  recipes-networking/cni/cni_0.7.1.bb | 71 +-------------------------
>>  recipes-networking/cni/cni_git.bb   | 73 +-------------------------
>>  3 files changed, 83 insertions(+), 140 deletions(-)
>>  create mode 100644 recipes-networking/cni/cni.inc
>>
>> diff --git a/recipes-networking/cni/cni.inc b/recipes-networking/cni/cni.inc
>> new file mode 100644
>> index 0000000..7a3b87f
>> --- /dev/null
>> +++ b/recipes-networking/cni/cni.inc
>> @@ -0,0 +1,79 @@
>> +HOMEPAGE = "https://github.com/containernetworking/cni"
>> +SUMMARY = "Container Network Interface - networking for Linux containers"
>> +DESCRIPTION = "CNI (Container Network Interface), a Cloud Native Computing \
>> +Foundation project, consists of a specification and libraries for writing \
>> +plugins to configure network interfaces in Linux containers, along with a \
>> +number of supported plugins. CNI concerns itself only with network connectivity \
>> +of containers and removing allocated resources when the container is deleted. \
>> +Because of this focus, CNI has a wide range of support and the specification \
>> +is simple to implement. \
>> +"
>> +
>> +# 0.7.1
>> +SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
>> +# 0.7.5
>> +SRCREV_plugins = "a62711a5da7a2dc2eb93eac47e103738ad923fd6"
>> +SRC_URI = "\
>> +       git://github.com/containernetworking/cni.git;branch=master;name=cni \
>> +        git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins \
>> +       "
>> +
>> +RPROVIDES_${PN} += "kubernetes-cni"
>> +
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>> +
>> +GO_IMPORT = "import"
>> +
>> +PV = "0.7.1"
>> +
>> +inherit go
>> +inherit goarch
>> +
>> +do_compile() {
>> +       # link fixups for compilation
>> +       rm -f ${S}/src/import/vendor/src
>> +       mkdir -p ${S}/src/import/vendor/
>> +       ln -sf ./ ${S}/src/import/vendor/src
>> +       rm -rf ${S}/src/import/plugins
>> +       rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
>> +
>> +       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
>> +
>> +       ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>> +       ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
>> +       ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>> +       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
>> +
>> +       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>> +       export CGO_ENABLED="1"
>> +
>> +       cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>> +       ${GO} build
>> +
>> +       cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>> +       ${GO} build
>> +
>> +       cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
>> +       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
>> +       mkdir -p ${WORKDIR}/plugins/bin/
>> +       for p in $PLUGINS; do
>> +           plugin="$(basename "$p")"
>> +           echo "building: $p"
>> +           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
>> +       done
>> +}
>> +
>> +do_install() {
>> +    localbindir="/opt/cni/bin"
>> +
>> +    install -d ${D}${localbindir}
>> +    install -d ${D}/${sysconfdir}/cni/net.d
>> +
>> +    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
>> +    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>> +}
>> +
>> +FILES_${PN} += "/opt/cni/bin/*"
>> +
>> +INSANE_SKIP_${PN} += "ldflags already-stripped"
>> diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni/cni_0.7.1.bb
>> index 7a3b87f..7977040 100644
>> --- a/recipes-networking/cni/cni_0.7.1.bb
>> +++ b/recipes-networking/cni/cni_0.7.1.bb
>> @@ -1,13 +1,5 @@
>> -HOMEPAGE = "https://github.com/containernetworking/cni"
>> -SUMMARY = "Container Network Interface - networking for Linux containers"
>> -DESCRIPTION = "CNI (Container Network Interface), a Cloud Native Computing \
>> -Foundation project, consists of a specification and libraries for writing \
>> -plugins to configure network interfaces in Linux containers, along with a \
>> -number of supported plugins. CNI concerns itself only with network connectivity \
>> -of containers and removing allocated resources when the container is deleted. \
>> -Because of this focus, CNI has a wide range of support and the specification \
>> -is simple to implement. \
>> -"
>> +# This cni version is here to ensure that basic k8s setup with flannel could work.
>> +require cni.inc
>>
>>  # 0.7.1
>>  SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
>> @@ -17,63 +9,4 @@ SRC_URI = "\
>>         git://github.com/containernetworking/cni.git;branch=master;name=cni \
>>          git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins \
>>         "
>> -
>> -RPROVIDES_${PN} += "kubernetes-cni"
>> -
>> -LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>> -
>> -GO_IMPORT = "import"
>> -
>>  PV = "0.7.1"
>> -
>> -inherit go
>> -inherit goarch
>> -
>> -do_compile() {
>> -       # link fixups for compilation
>> -       rm -f ${S}/src/import/vendor/src
>> -       mkdir -p ${S}/src/import/vendor/
>> -       ln -sf ./ ${S}/src/import/vendor/src
>> -       rm -rf ${S}/src/import/plugins
>> -       rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
>> -
>> -       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
>> -
>> -       ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>> -       ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
>> -       ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>> -       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
>> -
>> -       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>> -       export CGO_ENABLED="1"
>> -
>> -       cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>> -       ${GO} build
>> -
>> -       cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>> -       ${GO} build
>> -
>> -       cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
>> -       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
>> -       mkdir -p ${WORKDIR}/plugins/bin/
>> -       for p in $PLUGINS; do
>> -           plugin="$(basename "$p")"
>> -           echo "building: $p"
>> -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
>> -       done
>> -}
>> -
>> -do_install() {
>> -    localbindir="/opt/cni/bin"
>> -
>> -    install -d ${D}${localbindir}
>> -    install -d ${D}/${sysconfdir}/cni/net.d
>> -
>> -    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
>> -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>> -}
>> -
>> -FILES_${PN} += "/opt/cni/bin/*"
>> -
>> -INSANE_SKIP_${PN} += "ldflags already-stripped"
>> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
>> index 5348b95..06b37a4 100644
>> --- a/recipes-networking/cni/cni_git.bb
>> +++ b/recipes-networking/cni/cni_git.bb
>> @@ -1,13 +1,5 @@
>> -HOMEPAGE = "https://github.com/containernetworking/cni"
>> -SUMMARY = "Container Network Interface - networking for Linux containers"
>> -DESCRIPTION = "CNI (Container Network Interface), a Cloud Native Computing \
>> -Foundation project, consists of a specification and libraries for writing \
>> -plugins to configure network interfaces in Linux containers, along with a \
>> -number of supported plugins. CNI concerns itself only with network connectivity \
>> -of containers and removing allocated resources when the container is deleted. \
>> -Because of this focus, CNI has a wide range of support and the specification \
>> -is simple to implement. \
>> -"
>> +# This cni version is supposed to track latest upstream.
>> +require cni.inc
>>
>>  SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
>>  SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
>> @@ -15,65 +7,4 @@ SRC_URI = "\
>>         git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
>>          git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
>>         "
>> -
>> -RPROVIDES_${PN} += "kubernetes-cni"
>> -
>> -LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>> -
>> -GO_IMPORT = "import"
>> -
>>  PV = "0.7.0+git${SRCREV_cni}"
>> -
>> -inherit go
>> -inherit goarch
>> -
>> -do_compile() {
>> -       # link fixups for compilation
>> -       rm -f ${S}/src/import/vendor/src
>> -       mkdir -p ${S}/src/import/vendor/
>> -       ln -sf ./ ${S}/src/import/vendor/src
>> -       rm -rf ${S}/src/import/plugins
>> -       rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
>> -
>> -       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
>> -
>> -       ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>> -       ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
>> -       ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>> -       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
>> -
>> -       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>> -       export CGO_ENABLED="1"
>> -
>> -       cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
>> -       ${GO} build
>> -
>> -       cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>> -       ${GO} build
>> -
>> -       cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
>> -       PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
>> -       mkdir -p ${WORKDIR}/plugins/bin/
>> -       for p in $PLUGINS; do
>> -           plugin="$(basename "$p")"
>> -           echo "building: $p"
>> -           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
>> -       done
>> -}
>> -
>> -do_install() {
>> -    localbindir="/opt/cni/bin"
>> -
>> -    install -d ${D}${localbindir}
>> -    install -d ${D}/${sysconfdir}/cni/net.d
>> -
>> -    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
>> -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>> -}
>> -
>> -FILES_${PN} += "/opt/cni/bin/*"
>> -
>> -INSANE_SKIP_${PN} += "ldflags already-stripped"
>> -
>> -deltask compile_ptest_base
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

