Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77A33E0043F; Tue, 28 Aug 2018 05:21:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1ADB6E003C1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:21:56 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 203-v6so1206058ljj.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hmn9otbmfs0FbsCharNbaVSiONQ9XTK2h7M/JsjLjj4=;
	b=d4mBZ8Ahsg21cYZNb21a2ct7G/AgSIOELEPzrkRzAN0wl+vmC6GFCBmXB2ufaATT2n
	jOlz0uXemZjcnEFvqyS85/+BJ1eAYcnPXiqDROJal18QLLfII0cZFwls5C+M2tRhW0Ss
	Gkj8oq35qAz/cCTlCsanVrMZySFHggtTcYPaRrjS7tE5hwFkMCwBL8hhkRnkhAM0UAMH
	VFH9I9JiU1R2D+3mimAGelDBLIBaPQymLrNwc95XMIGUNcI3XKj1wB/Vw49mqxynwJiW
	N02k/fjLbY3NtfFBNfj90afwxbW61fbuUcrJ6HwPSUBPhl25eTn94NW8/m6IA2vD5mSW
	7lGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hmn9otbmfs0FbsCharNbaVSiONQ9XTK2h7M/JsjLjj4=;
	b=jMrScRMyhJML6ShXYAR+/ay9u3FPO/8fFwqe0YcmTKXv2a/0yN4Nh0w0wRsIkU54E/
	sgsTzGdWilLv6pmD/mbWpyEE6XmM7fcbz9bTrasI8GwrXAWYSiG7NM0w1jWGgZht6E7C
	BvPVSSzsqTuCwGfsHEjBrTuy5CxSbVy1tJFnz85Mw+9ScuRrUK+jnyZ9FB+u8DSGqifc
	vlShNax6e/z+Hh0DmZlxoJcl0YbPy+S5vCZVHd1tP7nSnkIgc6kLrQwfc2F1tsjOJEUf
	ekSHxS80mxVPerMdTS5zrfL9e2q/AK8gk1kEGlunBd/GWaCi+KTKWwXmtMpJU5NuEYEx
	eh2g==
X-Gm-Message-State: APzg51DqqDHhEw5qOoGCOTJ01H7AlnmtygKwMLn7wmJ+d2BZN9rweg+Q
	YWa/lOkri0kcpWfaMV4YekNhShWVVWxjRIxeY8c=
X-Google-Smtp-Source: ANB0VdaTrZBW1P8T/sf12uRLz52hscqaDBl1jGIvYaD0GABg5lxx85Z0dFHr9eZ4cGZ1Pjxpym9Cr8aqMsDDmLBqTsw=
X-Received: by 2002:a2e:2b1b:: with SMTP id
	q27-v6mr1072181lje.147.1535458915014; 
	Tue, 28 Aug 2018 05:21:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 05:21:54
	-0700 (PDT)
In-Reply-To: <20180820160023.5432-2-adrian.ratiu@ni.com>
References: <20180820160023.5432-1-adrian.ratiu@ni.com>
	<20180820160023.5432-2-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Aug 2018 08:21:54 -0400
Message-ID: <CADkTA4NY_1JegyjPgRqpV-GAyTyWwA5x8Dm4vMgZbR4eHwyEHA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Sergey Kizunov <sergey.kizunov@ni.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH 2/2] salt: bump 2016.11 -> 2018.3
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
X-List-Received-Date: Tue, 28 Aug 2018 12:21:57 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 20, 2018 at 12:00 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> From: Sergey Kizunov <sergey.kizunov@ni.com>
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../{salt_2016.11.0.bb => salt_2018.3.0.bb}   | 25 +++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>  rename meta-openstack/recipes-support/salt/{salt_2016.11.0.bb => salt_2018.3.0.bb} (89%)
>
> diff --git a/meta-openstack/recipes-support/salt/salt_2016.11.0.bb b/meta-openstack/recipes-support/salt/salt_2018.3.0.bb
> similarity index 89%
> rename from meta-openstack/recipes-support/salt/salt_2016.11.0.bb
> rename to meta-openstack/recipes-support/salt/salt_2018.3.0.bb
> index ba1def7..a4022be 100644
> --- a/meta-openstack/recipes-support/salt/salt_2016.11.0.bb
> +++ b/meta-openstack/recipes-support/salt/salt_2018.3.0.bb
> @@ -13,8 +13,7 @@ PACKAGECONFIG ??= "zeromq"
>  PACKAGECONFIG[zeromq] = ",,python-pyzmq python-pycrypto,"
>  PACKAGECONFIG[tcp] = ",,python-pycrypto"
>
> -SRCNAME = "salt"
> -SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> +SRC_URI = "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-${PV}.tar.gz \
>             file://set_python_location_hashbang.patch \
>             file://minion \
>             file://salt-minion \
> @@ -28,10 +27,10 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME
>             file://roster \
>  "
>
> -SRC_URI[md5sum] = "eced07a652cc6a31870fc098d5325a9c"
> -SRC_URI[sha256sum] = "b516285926ee95cedc64ecddab05d14422b7c8819c9f6d046a431c41d608e6bc"
> +SRC_URI[md5sum] = "b6ec271b59554b9af7ff4005028434b5"
> +SRC_URI[sha256sum] = "a0a45d22fdf6961542a419b7e09568a3118e2b019ffe7bab9dee5aeb55b56b31"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${WORKDIR}/${PN}-${PV}"
>
>  inherit setuptools update-rc.d
>
> @@ -89,7 +88,7 @@ Between the remote execution system, and state management Salt addresses the bac
>
>  SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
>  DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
> -RDEPENDS_${PN}-minion = "python (>=2.6), ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
> +RDEPENDS_${PN}-minion = "${PN}-common (= ${EXTENDPKGV}) python-msgpack"
>  RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
>  RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python-pycrypto', '',d)}"
>  RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
> @@ -102,7 +101,7 @@ INITSCRIPT_PARAMS_${PN}-minion = "defaults"
>  SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
>  DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
>  salt-master, salt-minion, and salt-syndic require to function."
> -RDEPENDS_${PN}-common = "python (>= 2.7.5-5) python (< 2.8) python-dateutil python-jinja2 python-pyyaml python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
> +RDEPENDS_${PN}-common = "python-dateutil python-jinja2 python-pyyaml python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
>  RRECOMMENDS_${PN}-common = "lsb python-futures"
>  RSUGGESTS_${PN}-common = "python-mako python-git"
>  RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
> @@ -113,7 +112,7 @@ SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
>  DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides the salt ssh controller. It \
>  is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
>   to be installed on the remote host."
> -RDEPENDS_${PN}-ssh = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
> +RDEPENDS_${PN}-ssh = "${PN}-common (= ${EXTENDPKGV}) python-msgpack"
>  CONFFILES_${PN}-ssh="${sysconfdir}/${PN}/roster"
>  FILES_${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
>
> @@ -123,7 +122,7 @@ running Salt system. It can start and manage multiple interfaces allowing a REST
>  even a Websocket API. The Salt API system is used to expose the fundamental aspects of Salt control to external\
>   sources. salt-api acts as the bridge between Salt itself and REST, Websockets, etc. Documentation is available\
>   on Read the Docs: http://salt-api.readthedocs.org/"
> -RDEPENDS_${PN}-api = "python (>= 2.6) ${PN}-master"
> +RDEPENDS_${PN}-api = "${PN}-master"
>  RSUGGESTS_${PN}-api = "python-cherrypy"
>  CONFFILES_${PN}-api = "${sysconfdir}/init.d/${PN}-api"
>  FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api}"
> @@ -132,7 +131,7 @@ INITSCRIPT_PARAMS_${PN}-api = "defaults"
>
>  SUMMARY_${PN}-master = "remote manager to administer servers via salt"
>  DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
> -RDEPENDS_${PN}-master = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
> +RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python-msgpack"
>  RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
>  RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python-pycrypto', '',d)}"
>  CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
> @@ -144,7 +143,7 @@ INITSCRIPT_PARAMS_${PN}-master = "defaults"
>  SUMMARY_${PN}-syndic = "master-of-masters for salt, the distributed remote execution system"
>  DESCRIPTION_${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
>  salt; it enables the management of multiple masters at a time."
> -RDEPENDS_${PN}-syndic = "python (>= 2.6) ${PN}-master (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-syndic = "${PN}-master (= ${EXTENDPKGV})"
>  CONFFILES_${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
>  FILES_${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic}"
>  INITSCRIPT_NAME_${PN}-syndic = "${PN}-syndic"
> @@ -152,14 +151,14 @@ INITSCRIPT_PARAMS_${PN}-syndic = "defaults"
>
>  SUMMARY_${PN}-cloud = "public cloud VM management system"
>  DESCRIPTION_${PN}-cloud = "provision virtual machines on various public clouds via a cleanly controlled profile and mapping system."
> -RDEPENDS_${PN}-cloud = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-cloud = "${PN}-common (= ${EXTENDPKGV})"
>  RSUGGESTS_${PN}-cloud = "python-netaddr python-botocore"
>  CONFFILES_${PN}-cloud = "${sysconfdir}/${PN}/cloud"
>  FILES_${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
>
>  SUMMARY_${PN}-tests = "salt stack test suite"
>  DESCRIPTION_${PN}-tests ="${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
> -RDEPENDS_${PN}-tests = "${PN}-common python-salttesting python-tests python-image bash"
> +RDEPENDS_${PN}-tests = "${PN}-common python-pytest-salt python-tests python-image bash"
>  FILES_${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/salt-tests/tests/"
>
>  FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/${PN}-common"
> --
> 2.18.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

