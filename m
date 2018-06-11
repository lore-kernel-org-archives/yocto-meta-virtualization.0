Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43ACFE022BA; Mon, 11 Jun 2018 09:07:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.44 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C37CE01462
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 09:07:26 -0700 (PDT)
Received: by mail-lf0-f44.google.com with SMTP id u4-v6so31414968lff.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fI7EZnVDUnZSz+J18YlVvbCWZTt2AywagoWctan7Oh4=;
	b=fiFEQFd0+L9TDRS50409FbrGNbdOJ/6yO+kiA46+5cUuJONAybGf8JMUW7NqMrIfKs
	8fuY91S+Q7hLBc1faiepjXa7bWAIqhkiFPzzZ+naioDhQnYkPwR+aN+E71o8eqQ5yeYh
	Qs6WROQb7DWamv7R2cTDAw6Djwdsl2LmjWJuJvv/2bwV/db0WMvO/1XCEAl9MeAGxvys
	djPAbOvDlNjt6nbnKX6w1PqLZg1y8l/86JPLp6zlARhudW0A0uLTktFw4vl5BSXev35P
	IP/Efz0nDNqwEBKQ4d/gKjE1DWxOCFrtqWN/7K4FwBL7t328AmxKVgQr9OSWaghe4YaP
	zjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fI7EZnVDUnZSz+J18YlVvbCWZTt2AywagoWctan7Oh4=;
	b=VCrPk9+zusX7eRrdXaX0H0k01FjUWNMYXQA4HaLcw/qWgDQf6EXH+N4l2AFBEnEVas
	fauQg2qGZIOKgwM2835O21/b4AiJDNz1qAAfDQ0PHTtBSuweUsWLThaCCKmfGL6rt6O+
	171+y7PH6uM6rVGilyrBg4LR0xUQ8qnWEEEZTEjFiE4uSEY7YzZMSeE0z4EnHa1q+t73
	g1/T1KjXikGULhYAqfG7OQggRSqFp71/HH0YsY28uV8QU3mkrF12aWI5G6/g2nFAgQhp
	Pzoue98SBStyDZvZLwDsfhImfqskJ6lUzUJsIL+P6Na7Jho8cdQ85Yn2QpimcsXcgRoj
	233w==
X-Gm-Message-State: APt69E25+kY9vnKZUP5vdMHUmN11AUJv1GU1JIau+ziO7CfVa1c20qAD
	0EDwPo9lAuHxJpKlegvAffXbARY6LInfW/zaEyk=
X-Google-Smtp-Source: ADUXVKKSWnBltj53u3C42aLIRnLHm/uAjC5HHeNPkTdB8PxoZ9QF9uDCQ6W6Fs6M4Zqn5FDSspoiHrKAtl7YnELDjnU=
X-Received: by 2002:a19:54da:: with SMTP id
	b87-v6mr10238577lfl.3.1528733245245; 
	Mon, 11 Jun 2018 09:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:07:24
	-0700 (PDT)
In-Reply-To: <1528727071-19039-1-git-send-email-mark.asselstine@windriver.com>
References: <1528727071-19039-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jun 2018 12:07:24 -0400
Message-ID: <CADkTA4MhdM7T8M-djSZCMva+NEKtQy1Y4BaYc8+V5RHfJe8s+w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] housekeeping: patch refresh
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
X-List-Received-Date: Mon, 11 Jun 2018 16:07:29 -0000
Content-Type: multipart/alternative; boundary="0000000000000a0e7f056e5ff253"

--0000000000000a0e7f056e5ff253
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Jun 11, 2018 at 10:24 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Bitbake now prints warnings when a patch is successfully applied but
> there is fuzz or an offset. The following refreshes patches for
> several packages which report warnings when openstack-image-controller
> is built.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...ican-fix-path-to-find-configuration-files.patch | 12 +++++------
>  ...ncrease-buffer-size-to-support-PKI-tokens.patch | 23
> +++++++++++-----------
>  .../fix_ceilometer_memory_leak.patch               | 18 +++++++++++------
>  .../python/python-horizon/fix_bindir_path.patch    | 21
> ++++++++++++++------
>  ...use-full-package-path-to-test-directories.patch | 10 ++++------
>  ...-path-of-header-files-check-in-Yocto-buil.patch | 14 ++++++-------
>  .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  |  8 +++-----
>  7 files changed, 57 insertions(+), 49 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-fix-path-to-find-configuration-files.patch
> b/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-fix-path-to-find-configuration-files.patch
> index 8fd1010..b7e74cd 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-fix-path-to-find-configuration-files.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-fix-path-to-find-configuration-files.patch
> @@ -1,4 +1,4 @@
> -From 30a57a0b4f2dcaff76821f21f4a545ecb9ddf194 Mon Sep 17 00:00:00 2001
> +From 3364915002aa2deaf63841e338375648e5dc8f24 Mon Sep 17 00:00:00 2001
>  From: Keith Holman <Keith.Holman@windriver.com>
>  Date: Fri, 13 Jun 2014 13:46:04 -0400
>  Subject: [PATCH] barbican: fix path to find configuration files
> @@ -10,15 +10,16 @@ recipe.  This fix updates the location for the
> configuration files
>  with an identifier that is replaced during deployment.
>
>  Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
> +
>  ---
>   barbican/tests/api/test_resources_policy.py | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>  diff --git a/barbican/tests/api/test_resources_policy.py
> b/barbican/tests/api/test_resources_policy.py
> -index 7d995c6..28b7599 100644
> +index 5c75bc3..f2332f6 100644
>  --- a/barbican/tests/api/test_resources_policy.py
>  +++ b/barbican/tests/api/test_resources_policy.py
> -@@ -35,8 +35,7 @@ from barbican.openstack.common import policy
> +@@ -37,8 +37,7 @@ from barbican.tests import utils
>   CONF = cfg.CONF
>
>   # Point to the policy.json file located in source control.
> @@ -26,8 +27,5 @@ index 7d995c6..28b7599 100644
>  -                                            '../../../etc', 'barbican'))
>  +TEST_VAR_DIR = "%BARBICAN_CONF_DIR%"
>
> - ENFORCER = policy.Enforcer()
> + ENFORCER = policy.Enforcer(CONF)
>
> ---
> -1.9.3
> -
> diff --git a/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
> b/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
> index acde89c..c85e473 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
> @@ -1,4 +1,4 @@
> -From 8b78d792ca7f7ba4e105225c3917c0a467a2fadb Mon Sep 17 00:00:00 2001
> +From 542a384cf1de68dc21ec335ff9518889e342d76e Mon Sep 17 00:00:00 2001
>  From: Keith Holman <Keith.Holman@windriver.com>
>  Date: Thu, 22 May 2014 12:08:13 -0400
>  Subject: [PATCH] barbican: increase buffer-size to support PKI tokens
> @@ -10,25 +10,26 @@ buffer size uWSGI uses fixes this problem.  This fix
> allows the
>  packet sized to be specified in the build recipe file.
>
>  Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
> +
>  ---
>   etc/barbican/vassals/barbican-admin.ini | 1 +
>   etc/barbican/vassals/barbican-api.ini   | 1 +
>   2 files changed, 2 insertions(+)
>
> -Index: git/etc/barbican/vassals/barbican-admin.ini
> -===================================================================
> ---- git.orig/etc/barbican/vassals/barbican-admin.ini
> -+++ git/etc/barbican/vassals/barbican-admin.ini
> -@@ -9,3 +9,4 @@
> +diff --git a/etc/barbican/vassals/barbican-admin.ini
> b/etc/barbican/vassals/barbican-admin.ini
> +index cd8bc49..562b6e7 100644
> +--- a/etc/barbican/vassals/barbican-admin.ini
> ++++ b/etc/barbican/vassals/barbican-admin.ini
> +@@ -9,3 +9,4 @@ memory-report = true
>   plugins = python
>   paste = config:/etc/barbican/barbican-admin-paste.ini
>   add-header = Connection: close
>  +buffer-size = %BARBICAN_MAX_PACKET_SIZE%
> -Index: git/etc/barbican/vassals/barbican-api.ini
> -===================================================================
> ---- git.orig/etc/barbican/vassals/barbican-api.ini
> -+++ git/etc/barbican/vassals/barbican-api.ini
> -@@ -9,3 +9,4 @@
> +diff --git a/etc/barbican/vassals/barbican-api.ini
> b/etc/barbican/vassals/barbican-api.ini
> +index a4f0bee..fa476b6 100644
> +--- a/etc/barbican/vassals/barbican-api.ini
> ++++ b/etc/barbican/vassals/barbican-api.ini
> +@@ -9,3 +9,4 @@ memory-report = true
>   plugins = python
>   paste = config:/etc/barbican/barbican-api-paste.ini
>   add-header = Connection: close
> diff --git a/meta-openstack/recipes-devtools/python/python-
> ceilometer/fix_ceilometer_memory_leak.patch b/meta-openstack/recipes-
> devtools/python/python-ceilometer/fix_ceilometer_memory_leak.patch
> index bdc1bf7..9581e90 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> ceilometer/fix_ceilometer_memory_leak.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> ceilometer/fix_ceilometer_memory_leak.patch
> @@ -1,10 +1,16 @@
> +From fd4b8446cf3cf01a21f4b4a43897fe2603be5aba Mon Sep 17 00:00:00 2001
> +From: Amy Fong <amy.fong@windriver.com>
> +Date: Fri, 28 Mar 2014 15:58:45 -0400
> +
>  ---
> - ceilometer/nova_client.py |    7 +++++++
> + ceilometer/nova_client.py | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> +diff --git a/ceilometer/nova_client.py b/ceilometer/nova_client.py
> +index 084c4ea..0219d00 100644
>  --- a/ceilometer/nova_client.py
>  +++ b/ceilometer/nova_client.py
> -@@ -26,6 +26,12 @@
> +@@ -38,6 +38,12 @@ cfg.CONF.import_group('service_credentials',
> 'ceilometer.service')
>
>   LOG = log.getLogger(__name__)
>
> @@ -17,11 +23,11 @@
>
>   def logged(func):
>
> -@@ -56,6 +62,7 @@
> -             endpoint_type=conf.os_endpoint_type,
> -             cacert=conf.os_cacert,
> +@@ -75,6 +81,7 @@ class Client(object):
> +             timeout=cfg.CONF.http_timeout,
> +             http_log_debug=cfg.CONF.nova_http_log_debug,
>               no_cache=True)
>  +        self.nova_client.set_timings_max_len(cfg.CONF.nova_client.
> max_timing_buffer)
>
>       def _with_flavor_and_image(self, instances):
> -         for instance in instances:
> +         flavor_cache = {}
> diff --git a/meta-openstack/recipes-devtools/python/python-horizon/fix_bindir_path.patch
> b/meta-openstack/recipes-devtools/python/python-
> horizon/fix_bindir_path.patch
> index c9d0b1a..d390ae1 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> horizon/fix_bindir_path.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> horizon/fix_bindir_path.patch
> @@ -1,11 +1,20 @@
> +From e56f1df2d7567ed428888429f51a6f4a0864a414 Mon Sep 17 00:00:00 2001
> +From: Mihai Prica <prica.mihai@gmail.com>
> +Date: Tue, 23 Jul 2013 10:56:00 +0300
> +Subject: [PATCH] python-horizon: Fix bindir search path
> +
>  Upstream-Status: Inappropriate [configuration]
>
> -Index: horizon-2013.1.2/openstack_dashboard/settings.py
> -===================================================================
> ---- horizon-2013.1.2.orig/openstack_dashboard/settings.py
> -+++ horizon-2013.1.2/openstack_dashboard/settings.py
> -@@ -29,7 +29,7 @@ warnings.formatwarning = lambda message,
> -                                 '%s: %s' % (category.__name__, message)
> +---
> + openstack_dashboard/settings.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/openstack_dashboard/settings.py b/openstack_dashboard/
> settings.py
> +index 51db4ca..a1f1d32 100644
> +--- a/openstack_dashboard/settings.py
> ++++ b/openstack_dashboard/settings.py
> +@@ -38,7 +38,7 @@ warnings.formatwarning = lambda message, category,
> *args, **kwargs: \
> +     '%s: %s' % (category.__name__, message)
>
>   ROOT_PATH = os.path.dirname(os.path.abspath(__file__))
>  -BIN_DIR = os.path.abspath(os.path.join(ROOT_PATH, '..', 'bin'))
> diff --git a/meta-openstack/recipes-devtools/python/python-
> horizon/horizon-use-full-package-path-to-test-directories.patch
> b/meta-openstack/recipes-devtools/python/python-horizon/horizon-use-full-
> package-path-to-test-directories.patch
> index e5e1966..ea29a16 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> horizon/horizon-use-full-package-path-to-test-directories.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> horizon/horizon-use-full-package-path-to-test-directories.patch
> @@ -1,4 +1,4 @@
> -From 89aa2a575687013f4b4f4d4353c50af1de4c26ba Mon Sep 17 00:00:00 2001
> +From 16f66dec1dc9e7c98cc5d6d0099a7865bf5b8e71 Mon Sep 17 00:00:00 2001
>  From: Keith Holman <Keith.Holman@windriver.com>
>  Date: Fri, 30 May 2014 11:58:33 -0400
>  Subject: [PATCH] horizon: use full package path to test directories
> @@ -15,15 +15,16 @@ within the build recipe with the full path to the
> python site
>  packages.
>
>  Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
> +
>  ---
>   horizon/test/settings.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/horizon/test/settings.py b/horizon/test/settings.py
> -index f5ea700..10318eb 100644
> +index fde7c12..3df65af 100644
>  --- a/horizon/test/settings.py
>  +++ b/horizon/test/settings.py
> -@@ -95,8 +95,8 @@ SITE_BRANDING = 'Horizon'
> +@@ -109,8 +109,8 @@ SITE_BRANDING = 'Horizon'
>   TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'
>   NOSE_ARGS = ['--nocapture',
>                '--nologcapture',
> @@ -34,6 +35,3 @@ index f5ea700..10318eb 100644
>                '--cover-package=horizon',
>                '--cover-inclusive',
>                '--all-modules']
> ---
> -1.9.3
> -
> diff --git a/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> b/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> index 6630163..173ecb6 100644
> --- a/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> +++ b/meta-openstack/recipes-support/tgt/files/0001-
> Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> @@ -1,4 +1,4 @@
> -From 5f6a261e44fec387e66d8b89d69f9602de5d5c53 Mon Sep 17 00:00:00 2001
> +From 93fea40915d01be6d02587a0b8be85a642e6a8d5 Mon Sep 17 00:00:00 2001
>  From: Zhenhua Luo <zhenhua.luo@freescale.com>
>  Date: Thu, 10 Apr 2014 11:26:39 +0800
>  Subject: [PATCH] Correct the path of header files check in Yocto build env
> @@ -13,18 +13,19 @@ error appears. Change the path of header check.
>  | compilation terminated.
>
>  Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +
>  ---
>   usr/Makefile | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/usr/Makefile b/usr/Makefile
> -index 453eb1a..191503d 100644
> +index decf13c..9ff8f15 100644
>  --- a/usr/Makefile
>  +++ b/usr/Makefile
>  @@ -1,11 +1,11 @@
>   sbindir ?= $(PREFIX)/sbin
>   libdir ?= $(PREFIX)/lib/tgt
> -
> +
>  -ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
>  +ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo
> 1),)
>   CFLAGS += -DUSE_SIGNALFD
> @@ -35,8 +36,8 @@ index 453eb1a..191503d 100644
>   CFLAGS += -DUSE_TIMERFD
>   endif
>
> -@@ -25,7 +25,7 @@ TGTD_OBJS += bs_rbd.o
> - CFLAGS += -DUSE_TIMERFD
> +@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
> + CFLAGS += -DUSE_SYSTEMD
>   endif
>
>  -ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
> /usr/include/libaio.h && echo 1),)
> @@ -44,6 +45,3 @@ index 453eb1a..191503d 100644
>   CFLAGS += -DUSE_EVENTFD
>   TGTD_OBJS += bs_aio.o
>   LIBS += -laio
> ---
> -1.9.1
> -
> diff --git a/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> b/meta-openstack/recipes-support/tgt/files/0001-usr-
> Makefile-WARNING-fix.patch
> index f749101..078ba9e 100644
> --- a/meta-openstack/recipes-support/tgt/files/0001-usr-
> Makefile-WARNING-fix.patch
> +++ b/meta-openstack/recipes-support/tgt/files/0001-usr-
> Makefile-WARNING-fix.patch
> @@ -1,4 +1,4 @@
> -From 2a336ec5bf939d86425570617471df60140d839e Mon Sep 17 00:00:00 2001
> +From 6f4e3b11c7dccf83e2d18635c84837b212dfcc1c Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Sun, 26 Jul 2015 04:23:51 +0900
>  Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
> @@ -9,12 +9,13 @@ Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA
> Issue: tgt:
>  Upstream-Status: pending
>
>  Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +
>  ---
>   usr/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/usr/Makefile b/usr/Makefile
> -index 1fae7e7..2db109c 100644
> +index 9ff8f15..cc8df11 100644
>  --- a/usr/Makefile
>  +++ b/usr/Makefile
>  @@ -63,7 +63,7 @@ TGTD_OBJS += tgtd.o mgmt.o target.o scsi.o log.o
> driver.o util.o work.o \
> @@ -26,6 +27,3 @@ index 1fae7e7..2db109c 100644
>
>   .PHONY:all
>   all: $(PROGRAMS) $(MODULES)
> ---
> -1.8.4.2
> -
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000000a0e7f056e5ff253
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Mon, Jun 11, 2018 at 10:24 AM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Bitbake now prints warnings when=
 a patch is successfully applied but<br>
there is fuzz or an offset. The following refreshes patches for<br>
several packages which report warnings when openstack-image-controller<br>
is built.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0...ican-fix-path-to-find-<wbr>configuration-files.patch | 12 +++++---=
---<br>
=C2=A0...ncrease-buffer-size-to-<wbr>support-PKI-tokens.patch | 23 ++++++++=
+++-----------<br>
=C2=A0.../fix_ceilometer_memory_<wbr>leak.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++++++------<br>
=C2=A0.../python/python-horizon/fix_<wbr>bindir_path.patch=C2=A0 =C2=A0 | 2=
1 ++++++++++++++------<br>
=C2=A0...use-full-package-path-to-<wbr>test-directories.patch | 10 ++++----=
--<br>
=C2=A0...-path-of-header-files-<wbr>check-in-Yocto-buil.patch | 14 ++++++--=
-----<br>
=C2=A0.../tgt/files/0001-usr-<wbr>Makefile-WARNING-fix.patch=C2=A0 |=C2=A0 =
8 +++-----<br>
=C2=A07 files changed, 57 insertions(+), 49 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbic=
an/barbican-fix-path-to-<wbr>find-configuration-files.patch b/meta-openstac=
k/recipes-<wbr>devtools/python/python-<wbr>barbican/barbican-fix-path-to-<w=
br>find-configuration-files.patch<br>
index 8fd1010..b7e74cd 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbican/barb=
ican-fix-path-to-<wbr>find-configuration-files.patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbican/barb=
ican-fix-path-to-<wbr>find-configuration-files.patch<br>
@@ -1,4 +1,4 @@<br>
-From 30a57a0b4f2dcaff76821f21f4a545<wbr>ecb9ddf194 Mon Sep 17 00:00:00 200=
1<br>
+From 3364915002aa2deaf63841e3383756<wbr>48e5dc8f24 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Keith Holman &lt;<a href=3D"mailto:Keith.Holman@windriver.com">=
Keith.Holman@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 13 Jun 2014 13:46:04 -0400<br>
=C2=A0Subject: [PATCH] barbican: fix path to find configuration files<br>
@@ -10,15 +10,16 @@ recipe.=C2=A0 This fix updates the location for the con=
figuration files<br>
=C2=A0with an identifier that is replaced during deployment.<br>
<br>
=C2=A0Signed-off-by: Keith Holman &lt;<a href=3D"mailto:Keith.Holman@windri=
ver.com">Keith.Holman@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 barbican/tests/api/test_<wbr>resources_policy.py | 3 +--<br>
=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/barbican/tests/api/test_<wbr>resources_policy.py b/barbi=
can/tests/api/test_<wbr>resources_policy.py<br>
-index 7d995c6..28b7599 100644<br>
+index 5c75bc3..f2332f6 100644<br>
=C2=A0--- a/barbican/tests/api/test_<wbr>resources_policy.py<br>
=C2=A0+++ b/barbican/tests/api/test_<wbr>resources_policy.py<br>
-@@ -35,8 +35,7 @@ from barbican.openstack.common import policy<br>
+@@ -37,8 +37,7 @@ from barbican.tests import utils<br>
=C2=A0 CONF =3D cfg.CONF<br>
<br>
=C2=A0 # Point to the policy.json file located in source control.<br>
@@ -26,8 +27,5 @@ index 7d995c6..28b7599 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;../../../etc&#39;, &#39;barbican&#39;))<br>
=C2=A0+TEST_VAR_DIR =3D &quot;%BARBICAN_CONF_DIR%&quot;<br>
<br>
- ENFORCER =3D policy.Enforcer()<br>
+ ENFORCER =3D policy.Enforcer(CONF)<br>
<br>
--- <br>
-1.9.3<br>
-<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbic=
an/barbican-increase-<wbr>buffer-size-to-support-PKI-<wbr>tokens.patch b/me=
ta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbican/barbican-inc=
rease-<wbr>buffer-size-to-support-PKI-<wbr>tokens.patch<br>
index acde89c..c85e473 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbican/barb=
ican-increase-<wbr>buffer-size-to-support-PKI-<wbr>tokens.patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>barbican/barb=
ican-increase-<wbr>buffer-size-to-support-PKI-<wbr>tokens.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8b78d792ca7f7ba4e105225c3917c0<wbr>a467a2fadb Mon Sep 17 00:00:00 200=
1<br>
+From 542a384cf1de68dc21ec335ff95188<wbr>89e342d76e Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Keith Holman &lt;<a href=3D"mailto:Keith.Holman@windriver.com">=
Keith.Holman@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 22 May 2014 12:08:13 -0400<br>
=C2=A0Subject: [PATCH] barbican: increase buffer-size to support PKI tokens=
<br>
@@ -10,25 +10,26 @@ buffer size uWSGI uses fixes this problem.=C2=A0 This f=
ix allows the<br>
=C2=A0packet sized to be specified in the build recipe file.<br>
<br>
=C2=A0Signed-off-by: Keith Holman &lt;<a href=3D"mailto:Keith.Holman@windri=
ver.com">Keith.Holman@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 etc/barbican/vassals/barbican-<wbr>admin.ini | 1 +<br>
=C2=A0 etc/barbican/vassals/barbican-<wbr>api.ini=C2=A0 =C2=A0| 1 +<br>
=C2=A0 2 files changed, 2 insertions(+)<br>
<br>
-Index: git/etc/barbican/vassals/<wbr>barbican-admin.ini<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/etc/barbican/vassals/<wbr>barbican-admin.ini<br>
-+++ git/etc/barbican/vassals/<wbr>barbican-admin.ini<br>
-@@ -9,3 +9,4 @@<br>
+diff --git a/etc/barbican/vassals/<wbr>barbican-admin.ini b/etc/barbican/v=
assals/<wbr>barbican-admin.ini<br>
+index cd8bc49..562b6e7 100644<br>
+--- a/etc/barbican/vassals/<wbr>barbican-admin.ini<br>
++++ b/etc/barbican/vassals/<wbr>barbican-admin.ini<br>
+@@ -9,3 +9,4 @@ memory-report =3D true<br>
=C2=A0 plugins =3D python<br>
=C2=A0 paste =3D config:/etc/barbican/barbican-<wbr>admin-paste.ini<br>
=C2=A0 add-header =3D Connection: close<br>
=C2=A0+buffer-size =3D %BARBICAN_MAX_PACKET_SIZE%<br>
-Index: git/etc/barbican/vassals/<wbr>barbican-api.ini<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/etc/barbican/vassals/<wbr>barbican-api.ini<br>
-+++ git/etc/barbican/vassals/<wbr>barbican-api.ini<br>
-@@ -9,3 +9,4 @@<br>
+diff --git a/etc/barbican/vassals/<wbr>barbican-api.ini b/etc/barbican/vas=
sals/<wbr>barbican-api.ini<br>
+index a4f0bee..fa476b6 100644<br>
+--- a/etc/barbican/vassals/<wbr>barbican-api.ini<br>
++++ b/etc/barbican/vassals/<wbr>barbican-api.ini<br>
+@@ -9,3 +9,4 @@ memory-report =3D true<br>
=C2=A0 plugins =3D python<br>
=C2=A0 paste =3D config:/etc/barbican/barbican-<wbr>api-paste.ini<br>
=C2=A0 add-header =3D Connection: close<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>ceilom=
eter/fix_ceilometer_<wbr>memory_leak.patch b/meta-openstack/recipes-<wbr>de=
vtools/python/python-<wbr>ceilometer/fix_ceilometer_<wbr>memory_leak.patch<=
br>
index bdc1bf7..9581e90 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>ceilometer/fi=
x_ceilometer_<wbr>memory_leak.patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>ceilometer/fi=
x_ceilometer_<wbr>memory_leak.patch<br>
@@ -1,10 +1,16 @@<br>
+From fd4b8446cf3cf01a21f4b4a43897fe<wbr>2603be5aba Mon Sep 17 00:00:00 200=
1<br>
+From: Amy Fong &lt;<a href=3D"mailto:amy.fong@windriver.com">amy.fong@wind=
river.com</a>&gt;<br>
+Date: Fri, 28 Mar 2014 15:58:45 -0400<br>
+<br>
=C2=A0---<br>
- ceilometer/nova_client.py |=C2=A0 =C2=A0 7 +++++++<br>
+ ceilometer/nova_client.py | 7 +++++++<br>
=C2=A0 1 file changed, 7 insertions(+)<br>
<br>
+diff --git a/ceilometer/nova_client.py b/ceilometer/nova_client.py<br>
+index 084c4ea..0219d00 100644<br>
=C2=A0--- a/ceilometer/nova_client.py<br>
=C2=A0+++ b/ceilometer/nova_client.py<br>
-@@ -26,6 +26,12 @@<br>
+@@ -38,6 +38,12 @@ cfg.CONF.import_group(&#39;<wbr>service_credentials&#39=
;, &#39;ceilometer.service&#39;)<br>
<br>
=C2=A0 LOG =3D log.getLogger(__name__)<br>
<br>
@@ -17,11 +23,11 @@<br>
<br>
=C2=A0 def logged(func):<br>
<br>
-@@ -56,6 +62,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endpoint_type=3Dconf.os_<w=
br>endpoint_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cacert=3Dconf.os_cacert,<b=
r>
+@@ -75,6 +81,7 @@ class Client(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout=3Dcfg.CONF.http_ti=
meout,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http_log_debug=3Dcfg.CONF.=
nova_<wbr>http_log_debug,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_cache=3DTrue)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.nova_client.set_timings_<wbr>max_le=
n(cfg.CONF.nova_client.<wbr>max_timing_buffer)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 def _with_flavor_and_image(self, instances):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for instance in instances:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flavor_cache =3D {}<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>horizo=
n/fix_bindir_path.patch b/meta-openstack/recipes-<wbr>devtools/python/pytho=
n-<wbr>horizon/fix_bindir_path.patch<br>
index c9d0b1a..d390ae1 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>horizon/fix_b=
indir_path.patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>horizon/fix_b=
indir_path.patch<br>
@@ -1,11 +1,20 @@<br>
+From e56f1df2d7567ed428888429f51a6f<wbr>4a0864a414 Mon Sep 17 00:00:00 200=
1<br>
+From: Mihai Prica &lt;<a href=3D"mailto:prica.mihai@gmail.com">prica.mihai=
@gmail.com</a>&gt;<br>
+Date: Tue, 23 Jul 2013 10:56:00 +0300<br>
+Subject: [PATCH] python-horizon: Fix bindir search path<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
<br>
-Index: horizon-2013.1.2/openstack_<wbr>dashboard/settings.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- horizon-2013.1.2.orig/<wbr>openstack_dashboard/settings.<wbr>py<br>
-+++ horizon-2013.1.2/openstack_<wbr>dashboard/settings.py<br>
-@@ -29,7 +29,7 @@ warnings.formatwarning =3D lambda message,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;%s: %s&#39; % (category._=
_name__, message)<br>
+---<br>
+ openstack_dashboard/settings.<wbr>py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/openstack_dashboard/<wbr>settings.py b/openstack_dashboard/<w=
br>settings.py<br>
+index 51db4ca..a1f1d32 100644<br>
+--- a/openstack_dashboard/<wbr>settings.py<br>
++++ b/openstack_dashboard/<wbr>settings.py<br>
+@@ -38,7 +38,7 @@ warnings.formatwarning =3D lambda message, category, *ar=
gs, **kwargs: \<br>
+=C2=A0 =C2=A0 =C2=A0&#39;%s: %s&#39; % (category.__name__, message)<br>
<br>
=C2=A0 ROOT_PATH =3D os.path.dirname(os.path.<wbr>abspath(__file__))<br>
=C2=A0-BIN_DIR =3D os.path.abspath(os.path.join(<wbr>ROOT_PATH, &#39;..&#39=
;, &#39;bin&#39;))<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>horizo=
n/horizon-use-full-<wbr>package-path-to-test-<wbr>directories.patch b/meta-=
openstack/recipes-<wbr>devtools/python/python-<wbr>horizon/horizon-use-full=
-<wbr>package-path-to-test-<wbr>directories.patch<br>
index e5e1966..ea29a16 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>horizon/horiz=
on-use-full-<wbr>package-path-to-test-<wbr>directories.patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>horizon/horiz=
on-use-full-<wbr>package-path-to-test-<wbr>directories.patch<br>
@@ -1,4 +1,4 @@<br>
-From 89aa2a575687013f4b4f4d4353c50a<wbr>f1de4c26ba Mon Sep 17 00:00:00 200=
1<br>
+From 16f66dec1dc9e7c98cc5d6d0099a78<wbr>65bf5b8e71 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Keith Holman &lt;<a href=3D"mailto:Keith.Holman@windriver.com">=
Keith.Holman@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 30 May 2014 11:58:33 -0400<br>
=C2=A0Subject: [PATCH] horizon: use full package path to test directories<b=
r>
@@ -15,15 +15,16 @@ within the build recipe with the full path to the pytho=
n site<br>
=C2=A0packages.<br>
<br>
=C2=A0Signed-off-by: Keith Holman &lt;<a href=3D"mailto:Keith.Holman@windri=
ver.com">Keith.Holman@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 horizon/test/settings.py | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/horizon/test/settings.py b/horizon/test/settings.py<br>
-index f5ea700..10318eb 100644<br>
+index fde7c12..3df65af 100644<br>
=C2=A0--- a/horizon/test/settings.py<br>
=C2=A0+++ b/horizon/test/settings.py<br>
-@@ -95,8 +95,8 @@ SITE_BRANDING =3D &#39;Horizon&#39;<br>
+@@ -109,8 +109,8 @@ SITE_BRANDING =3D &#39;Horizon&#39;<br>
=C2=A0 TEST_RUNNER =3D &#39;django_nose.<wbr>NoseTestSuiteRunner&#39;<br>
=C2=A0 NOSE_ARGS =3D [&#39;--nocapture&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--nologcapture&=
#39;,<br>
@@ -34,6 +35,3 @@ index f5ea700..10318eb 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--cover-package=
=3Dhorizon&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--cover-inclusi=
ve&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--all-modules&#=
39;]<br>
--- <br>
-1.9.3<br>
-<br>
diff --git a/meta-openstack/recipes-<wbr>support/tgt/files/0001-<wbr>Correc=
t-the-path-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch b/meta-opens=
tack/recipes-<wbr>support/tgt/files/0001-<wbr>Correct-the-path-of-header-<w=
br>files-check-in-Yocto-buil.<wbr>patch<br>
index 6630163..173ecb6 100644<br>
--- a/meta-openstack/recipes-<wbr>support/tgt/files/0001-<wbr>Correct-the-p=
ath-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch<br>
+++ b/meta-openstack/recipes-<wbr>support/tgt/files/0001-<wbr>Correct-the-p=
ath-of-header-<wbr>files-check-in-Yocto-buil.<wbr>patch<br>
@@ -1,4 +1,4 @@<br>
-From 5f6a261e44fec387e66d8b89d69f96<wbr>02de5d5c53 Mon Sep 17 00:00:00 200=
1<br>
+From 93fea40915d01be6d02587a0b8be85<wbr>a642e6a8d5 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Zhenhua Luo &lt;<a href=3D"mailto:zhenhua.luo@freescale.com">zh=
enhua.luo@freescale.com</a>&gt;<br>
=C2=A0Date: Thu, 10 Apr 2014 11:26:39 +0800<br>
=C2=A0Subject: [PATCH] Correct the path of header files check in Yocto buil=
d env<br>
@@ -13,18 +13,19 @@ error appears. Change the path of header check.<br>
=C2=A0| compilation terminated.<br>
<br>
=C2=A0Signed-off-by: Zhenhua Luo &lt;<a href=3D"mailto:zhenhua.luo@freescal=
e.com">zhenhua.luo@freescale.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 usr/Makefile | 6 +++---<br>
=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/usr/Makefile b/usr/Makefile<br>
-index 453eb1a..191503d 100644<br>
+index decf13c..9ff8f15 100644<br>
=C2=A0--- a/usr/Makefile<br>
=C2=A0+++ b/usr/Makefile<br>
=C2=A0@@ -1,11 +1,11 @@<br>
=C2=A0 sbindir ?=3D $(PREFIX)/sbin<br>
=C2=A0 libdir ?=3D $(PREFIX)/lib/tgt<br>
-<br>
+ <br>
=C2=A0-ifneq ($(shell test -e /usr/include/linux/signalfd.h &amp;&amp; echo=
 1),)<br>
=C2=A0+ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/<wbr>signalfd.h =
&amp;&amp; echo 1),)<br>
=C2=A0 CFLAGS +=3D -DUSE_SIGNALFD<br>
@@ -35,8 +36,8 @@ index 453eb1a..191503d 100644<br>
=C2=A0 CFLAGS +=3D -DUSE_TIMERFD<br>
=C2=A0 endif<br>
<br>
-@@ -25,7 +25,7 @@ TGTD_OBJS +=3D bs_rbd.o<br>
- CFLAGS +=3D -DUSE_TIMERFD<br>
+@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)<br>
+ CFLAGS +=3D -DUSE_SYSTEMD<br>
=C2=A0 endif<br>
<br>
=C2=A0-ifneq ($(shell test -e /usr/include/sys/eventfd.h &amp;&amp; test -e=
 /usr/include/libaio.h &amp;&amp; echo 1),)<br>
@@ -44,6 +45,3 @@ index 453eb1a..191503d 100644<br>
=C2=A0 CFLAGS +=3D -DUSE_EVENTFD<br>
=C2=A0 TGTD_OBJS +=3D bs_aio.o<br>
=C2=A0 LIBS +=3D -laio<br>
--- <br>
-1.9.1<br>
-<br>
diff --git a/meta-openstack/recipes-<wbr>support/tgt/files/0001-usr-<wbr>Ma=
kefile-WARNING-fix.patch b/meta-openstack/recipes-<wbr>support/tgt/files/00=
01-usr-<wbr>Makefile-WARNING-fix.patch<br>
index f749101..078ba9e 100644<br>
--- a/meta-openstack/recipes-<wbr>support/tgt/files/0001-usr-<wbr>Makefile-=
WARNING-fix.patch<br>
+++ b/meta-openstack/recipes-<wbr>support/tgt/files/0001-usr-<wbr>Makefile-=
WARNING-fix.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2a336ec5bf939d86425570617471df<wbr>60140d839e Mon Sep 17 00:00:00 200=
1<br>
+From 6f4e3b11c7dccf83e2d18635c84837<wbr>b212dfcc1c Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixin.f=
nst@cn.fujitsu.com</a>&gt;<br>
=C2=A0Date: Sun, 26 Jul 2015 04:23:51 +0900<br>
=C2=A0Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:<br=
>
@@ -9,12 +9,13 @@ Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Is=
sue: tgt:<br>
=C2=A0Upstream-Status: pending<br>
<br>
=C2=A0Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com=
">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 usr/Makefile | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/usr/Makefile b/usr/Makefile<br>
-index 1fae7e7..2db109c 100644<br>
+index 9ff8f15..cc8df11 100644<br>
=C2=A0--- a/usr/Makefile<br>
=C2=A0+++ b/usr/Makefile<br>
=C2=A0@@ -63,7 +63,7 @@ TGTD_OBJS +=3D tgtd.o mgmt.o target.o scsi.o log.o =
driver.o util.o work.o \<br>
@@ -26,6 +27,3 @@ index 1fae7e7..2db109c 100644<br>
<br>
=C2=A0 .PHONY:all<br>
=C2=A0 all: $(PROGRAMS) $(MODULES)<br>
--- <br>
-1.8.4.2<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--0000000000000a0e7f056e5ff253--
