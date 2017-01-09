Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 369CDE0050B; Mon,  9 Jan 2017 09:25:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA997E0043B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Jan 2017 09:25:03 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v09HP2hn025810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Jan 2017 09:25:02 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 9 Jan 2017 09:25:01 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1483974263-17029-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e42179e9-6a13-1084-bd55-63d3a64167c9@windriver.com>
Date: Mon, 9 Jan 2017 12:25:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483974263-17029-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [mcs][PATCH] tgt: ensure build LDFLAGS apply to all executables
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
X-List-Received-Date: Mon, 09 Jan 2017 17:25:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-09 10:04 AM, Mark Asselstine wrote:
> Some of the tgt executables were not being built with the gnu-hash
> causing a QA error. There is no apparent reason to have differences in
> how the tgt executables are built so ensure they all use the LDFLAGS.

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  |  2 +-
>  ...Makefile-apply-LDFLAGS-to-all-executables.patch | 35 ++++++++++++++++++++++
>  meta-openstack/recipes-support/tgt/tgt_git.bb      |  8 +++--
>  3 files changed, 41 insertions(+), 4 deletions(-)
>  create mode 100644 meta-openstack/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
>
> diff --git a/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> index 15f5482..f749101 100644
> --- a/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> +++ b/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> @@ -22,7 +22,7 @@ index 1fae7e7..2db109c 100644
>   TGTD_DEP = $(TGTD_OBJS:.o=.d)
>
>  -LDFLAGS = -Wl,-E,-rpath=$(libdir)
> -+LDFLAGS = -Wl,-E
> ++LDFLAGS += -Wl,-E
>
>   .PHONY:all
>   all: $(PROGRAMS) $(MODULES)
> diff --git a/meta-openstack/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch b/meta-openstack/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
> new file mode 100644
> index 0000000..d480ef7
> --- /dev/null
> +++ b/meta-openstack/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
> @@ -0,0 +1,35 @@
> +From a815ac8ee16b344d9e24b445957f32bf2aafa532 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 5 Jan 2017 11:07:51 -0500
> +Subject: [PATCH] usr/Makefile: apply LDFLAGS to all executables
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + usr/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/usr/Makefile b/usr/Makefile
> +index cc8df11..c55fd68 100644
> +--- a/usr/Makefile
> ++++ b/usr/Makefile
> +@@ -78,7 +78,7 @@ TGTADM_OBJS = tgtadm.o concat_buf.o
> + TGTADM_DEP = $(TGTADM_OBJS:.o=.d)
> +
> + tgtadm: $(TGTADM_OBJS)
> +-	$(CC) $^ -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS)
> +
> + -include $(TGTADM_DEP)
> +
> +@@ -86,7 +86,7 @@ TGTIMG_OBJS = tgtimg.o libssc.o libcrc32c.o
> + TGTIMG_DEP = $(TGTIMG_OBJS:.o=.d)
> +
> + tgtimg: $(TGTIMG_OBJS)
> +-	$(CC) $^ -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS)
> +
> + -include $(TGTIMG_DEP)
> +
> +--
> +2.7.4
> +
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index 5c594b1..9ca181a 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -10,6 +10,7 @@ PV = "1.0.67+git${SRCPV}"
>  SRC_URI = "git://github.com/fujita/tgt.git \
>  	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
>          file://0001-usr-Makefile-WARNING-fix.patch \
> +        file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
>  "
>  SRC_URI += "file://tgtd.init"
>
> @@ -21,9 +22,10 @@ inherit update-rc.d
>
>  CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
>
> -do_compile() {
> -    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
> -}
> +#do_compile() {
> +#    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
> +#}
> +EXTRA_OEMAKE = "-e programs conf scripts"
>
>  do_install() {
>      oe_runmake -e DESTDIR="${D}" install-programs install-conf install-scripts
>


