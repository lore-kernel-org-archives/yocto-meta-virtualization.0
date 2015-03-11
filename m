Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C961FE00779; Wed, 11 Mar 2015 05:13:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E271E0076F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 05:13:49 -0700 (PDT)
Received: by pdbfl12 with SMTP id fl12so10773339pdb.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 05:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=X2ioY+z7H7FGYlLQTb/J6hBjnPDn5mL7PKGIuTRVqtY=;
	b=LGhyXZY28YQocJLgwK3tskFe9iGgJ2JjqoP0fiHc8sGI92oZNJoXTFESTWYNWbmS2i
	3MPXPUO8QBGxR69i6ddt07pzP1lDBnAg3r4/S2Ktq2enYKgqkyGLwp8yGj4BLtckj/SG
	y7kentQzZvHMCjrSFsJpWj2c8859DV7xiuaD6ATnJNxVE4zElytQta8YR39L2iQachoj
	XwQ+suYxuwb2+ptsDuDUemZ4YHPtyNivxhm+FALj4EohKQqWmkw2J2gkJmH0DiTryfyu
	amA4KmorOLZ5goV9lvZol/kJhsufGiIC2DIVTywemdSlTE+2iM9bV9/W9AC8sCFkkqMa
	TGxg==
X-Gm-Message-State: ALoCoQnD8FgP4bIbq5bEExUWojm/w53HHaypUhzZ3+RuA43jFTqdIpfE9iLVn3Y1Q9MpNQ9yrSiv
X-Received: by 10.66.121.161 with SMTP id ll1mr41225345pab.131.1426076028321; 
	Wed, 11 Mar 2015 05:13:48 -0700 (PDT)
Received: from Akusters-laptop-2.local ([2601:c:a700:3ba7:d9fd:a0f3:d1e1:8ad2])
	by mx.google.com with ESMTPSA id
	ba12sm5892976pac.23.2015.03.11.05.13.46
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 05:13:47 -0700 (PDT)
Message-ID: <55003178.4050206@mvista.com>
Date: Wed, 11 Mar 2015 05:13:44 -0700
From: "akuster@mvista" <akuster@mvista.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org
References: <1426063952-1217-1-git-send-email-bogdan.purcareata@freescale.com>
	<1426063952-1217-2-git-send-email-bogdan.purcareata@freescale.com>
In-Reply-To: <1426063952-1217-2-git-send-email-bogdan.purcareata@freescale.com>
Subject: Re: [PATCH v2 2/2] lxc: Add support for seccomp on PPC architectures
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
X-List-Received-Date: Wed, 11 Mar 2015 12:13:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 3/11/15 1:52 AM, Bogdan Purcareata wrote:
> Add the necessary bits to enable seccomp support for LXC running on PPC
> architectures. libseccomp added support for PPC [1], yet to be applied to
> Yocto/meta-security.

Cool, I will update meta-security soon. (thought I was on that mailing
list??)

- armin
> 
> [1] https://github.com/seccomp/libseccomp/tree/working-ppc64
> 
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  .../files/ppc-add-seccomp-support-for-lxc.patch    | 100 +++++++++++++++++++++
>  recipes-containers/lxc/lxc_1.0.7.bb                |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> 
> diff --git a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> new file mode 100644
> index 0000000..6faf791
> --- /dev/null
> +++ b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> @@ -0,0 +1,100 @@
> +From 29ca2ec418cb496ac8a19f0718a8474a55cfe16d Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Wed, 4 Feb 2015 11:28:32 +0000
> +Subject: [PATCH] seccomp: add ppc support
> +
> +This patch enables seccomp support for LXC containers running on PowerPC
> +architectures. It is based on the latest PowerPC support added to libseccomp, on
> +the working-ppc64 branch [1].
> +
> +Libseccomp has been tested on ppc, ppc64 and ppc64le architectures. LXC with
> +seccomp support has been tested on ppc and ppc64 architectures, using the
> +default seccomp policy example files delivered with the LXC package.
> +
> +[1] https://github.com/seccomp/libseccomp/commits/working-ppc64
> +
> +Upstream-Status: Pending
> +[https://lists.linuxcontainers.org/pipermail/lxc-devel/2015-March/011437.html]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +---
> + src/lxc/seccomp.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 42 insertions(+)
> +
> +diff --git a/src/lxc/seccomp.c b/src/lxc/seccomp.c
> +index 3ba6c9a..0e2310f 100644
> +--- a/src/lxc/seccomp.c
> ++++ b/src/lxc/seccomp.c
> +@@ -121,6 +121,9 @@ enum lxc_hostarch_t {
> +	lxc_seccomp_arch_i386,
> +	lxc_seccomp_arch_amd64,
> +	lxc_seccomp_arch_arm,
> ++	lxc_seccomp_arch_ppc64,
> ++	lxc_seccomp_arch_ppc64le,
> ++	lxc_seccomp_arch_ppc,
> +	lxc_seccomp_arch_unknown = 999,
> + };
> +
> +@@ -137,6 +140,12 @@ int get_hostarch(void)
> +		return lxc_seccomp_arch_amd64;
> +	else if (strncmp(uts.machine, "armv7", 5) == 0)
> +		return lxc_seccomp_arch_arm;
> ++	else if (strncmp(uts.machine, "ppc64le", 7) == 0)
> ++		return lxc_seccomp_arch_ppc64le;
> ++	else if (strncmp(uts.machine, "ppc64", 5) == 0)
> ++		return lxc_seccomp_arch_ppc64;
> ++	else if (strncmp(uts.machine, "ppc", 3) == 0)
> ++		return lxc_seccomp_arch_ppc;
> +	return lxc_seccomp_arch_unknown;
> + }
> +
> +@@ -150,6 +159,9 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
> +	case lxc_seccomp_arch_i386: arch = SCMP_ARCH_X86; break;
> +	case lxc_seccomp_arch_amd64: arch = SCMP_ARCH_X86_64; break;
> +	case lxc_seccomp_arch_arm: arch = SCMP_ARCH_ARM; break;
> ++	case lxc_seccomp_arch_ppc64le: arch = SCMP_ARCH_PPC64LE; break;
> ++	case lxc_seccomp_arch_ppc64: arch = SCMP_ARCH_PPC64; break;
> ++	case lxc_seccomp_arch_ppc: arch = SCMP_ARCH_PPC; break;
> +	default: return NULL;
> +	}
> +
> +@@ -343,6 +355,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
> +				cur_rule_arch = lxc_seccomp_arch_arm;
> +			}
> + #endif
> ++#ifdef SCMP_ARCH_PPC64LE
> ++			else if (strcmp(line, "[ppc64le]") == 0 ||
> ++					strcmp(line, "[PPC64LE]") == 0) {
> ++				if (native_arch != lxc_seccomp_arch_ppc64le) {
> ++					cur_rule_arch = lxc_seccomp_arch_unknown;
> ++					continue;
> ++				}
> ++				cur_rule_arch = lxc_seccomp_arch_ppc64le;
> ++			}
> ++#endif
> ++#ifdef SCMP_ARCH_PPC64
> ++			else if (strcmp(line, "[ppc64]") == 0 ||
> ++					strcmp(line, "[PPC64]") == 0) {
> ++				if (native_arch != lxc_seccomp_arch_ppc64) {
> ++					cur_rule_arch = lxc_seccomp_arch_unknown;
> ++					continue;
> ++				}
> ++				cur_rule_arch = lxc_seccomp_arch_ppc64;
> ++			}
> ++#endif
> ++#ifdef SCMP_ARCH_PPC
> ++			else if (strcmp(line, "[ppc]") == 0 ||
> ++					strcmp(line, "[PPC]") == 0) {
> ++				if (native_arch != lxc_seccomp_arch_ppc) {
> ++					cur_rule_arch = lxc_seccomp_arch_unknown;
> ++					continue;
> ++				}
> ++				cur_rule_arch = lxc_seccomp_arch_ppc;
> ++			}
> ++#endif
> +			else
> +				goto bad_arch;
> +
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
> index b01c006..c9eef75 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -29,6 +29,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://add-lxc.rebootsignal.patch \
>  	file://document-lxc.rebootsignal.patch \
>  	file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
> +	file://ppc-add-seccomp-support-for-lxc.patch \
>  	"
>  
>  SRC_URI[md5sum] = "b48f468a9bef0e4e140dd723f0a65ad0"
> 

