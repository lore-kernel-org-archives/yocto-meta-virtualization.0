Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0F3E7717D
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 03:40:06 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.2221.1733801998941244200
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 19:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PN5rJD2x;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6da2d7884so93844485a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 19:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801998; x=1734406798; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQvRR8yNiGq2930EelnDaj7COurKgP/UlDe+dC3TQb8=;
        b=PN5rJD2xSmhRzHTO/D0Ys+MPVNLLfh9F10HeS2f1vXEWLiGHn8u623wLTTCez+xMvh
         3DVwjs2v5eT1Kbvr2ISr4jW9rDvvfjpaKiWcUeCtsH6azdQfurd6ioica0d32HyoLyh4
         w2FxT0oYU1BMm17NvTfDluf88V56fk1hnRUUriF2foapl+LZjK2Hy/vxD8sZOX9gZ9cV
         +U36V2zAFL0LZxWxiwUaHRzQXa4cL1b8sHFM20HPRUhhEKK1nyhWhJqh3FDTmbuBDiNs
         XBPWZr6NOAHU3sB4bTixYessykg8YzJbeNvWbvAVbm68pA+fkPGJr874TUgP4HxcoVqc
         ew2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801998; x=1734406798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQvRR8yNiGq2930EelnDaj7COurKgP/UlDe+dC3TQb8=;
        b=TNLfqQ+9Zb4uQ3i+IfPjumJTX1RWOjk8aUPOjydnQUTrkBuXoDjmgaIwjYmZN+im+d
         CQa2/Y34zBnicu08RmzDvTTdMyOTagWZk3+GKWBQiXLq9Ath2pTtIUC16B5VoZ9DuM9f
         CadCvFbSoeHRk2MTDFggYdk1/16x0zcs+dXAxIU7xh3YSmgGomrB1HuR2h1AB7/YdtWx
         TcJrNDJvILlFHFx2Va9Sx/nBEA77jEZlvqGgFvWcQUlWAumNmuQUPrVY1LO7VVoVFktt
         OO6Px69IF+G1fwTgaPGE5a/di3Jd1HbGfQaKfFE5o234mjjb2LAuxiU+jfrF7t7JBhs6
         FvxA==
X-Gm-Message-State: AOJu0YxHDrc/6rao7l8BPHpwLqztnvtrAkQH9DtOnAvbHTaoUf43O9B+
	QYz0lrD0OPWlkROwi6D7Br45HoRlMWAHRTWViKNqQrsqaofZHSF2KZy3ZjgX
X-Gm-Gg: ASbGncuh3Iz2HvrY8eWXDEhPNhmiYPkdqcj/oHpu7X9pY9hhvejOnKneee9L9fSHSgP
	Lu6saQ6lJsBR/po1xfD043FMcqOvLIttGWG1QaNprUgfoGiLb6disqOcdnddOrZ04MUVdKjIvOn
	hmYbv4gsK7vDLohaqbVNvZyc1j34gQNAPx1rpZOsNsHT1JIRNVKOvo60LhFphKjyBnmLcbqjuym
	mk6QMoKTQsZlwTF0vRBviaW0QY/xv7E27CEOfKQvfpJJMfjbCEDw6WcbFkOWAamc65/GlGKbp6x
	p8X5nR63VDh0Sr+lIuJ44lfmsphfc6+l
X-Google-Smtp-Source: AGHT+IEaLuP27q9npgRg/iG0J7QKpBNkKlDHodhQJeK817DdlSLLEwEfHzXW+qMokhCF6EkvKt1ibQ==
X-Received: by 2002:a05:620a:6184:b0:7b6:6365:1b72 with SMTP id af79cd13be357-7b6dcdcd8acmr558696285a.3.1733801997834;
        Mon, 09 Dec 2024 19:39:57 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6c4ed20e8sm308272785a.63.2024.12.09.19.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 19:39:56 -0800 (PST)
Date: Tue, 10 Dec 2024 03:39:54 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix
 CVE-2023-37154
Message-ID: <Z1e4CmoAbU4/LkOK@gmail.com>
References: <20241128030717.3733955-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128030717.3733955-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 03:40:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9049

merged.

Bruce

In message: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix CVE-2023-37154
on 28/11/2024 Changqing Li via lists.yoctoproject.org wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> CVE-2023-37154:
> check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary command execution
> via ProxyCommand, LocalCommand, and PermitLocalCommand with \${IFS}. This has
> been categorized both as fixed in e8810de, and as intended behavior.
> 
> Refer:
> https://nvd.nist.gov/vuln/detail/CVE-2023-37154
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../nagios-plugins/CVE-2023-37154.patch       | 69 +++++++++++++++++++
>  .../nagios/nagios-plugins_2.2.1.bb            |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> 
> diff --git a/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> new file mode 100644
> index 00000000..436bba42
> --- /dev/null
> +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> @@ -0,0 +1,69 @@
> +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:00 2001
> +From: Sebastian Wolf <swolf@nagios.com>
> +Date: Wed, 31 May 2023 16:43:54 -0400
> +Subject: [PATCH] check_by_ssh: Prevent users from using several SSH options
> + which run local commands.
> +
> +CVE: CVE-2023-37154
> +Upstream-Status: Backport [https://github.com/nagios-plugins/nagios-plugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + configure.ac           | 10 ++++++++++
> + plugins/check_by_ssh.c | 12 +++++++++++-
> + 2 files changed, 21 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 963514a..236d233 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -418,6 +418,16 @@ then
> + 		[path and arguments for invoking 'who'])
> + fi
> + 
> ++AC_ARG_WITH(unrestricted_ssh_options,
> ++	[AS_HELP_STRING([--with-unrestricted-ssh-options],
> ++		[allow any SSH options to be used with check_by_ssh])],
> ++	[],
> ++	[unrestricted_ssh_options=no])
> ++
> ++if test "x$with_unrestricted_ssh_options" = xyes ; then
> ++	AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allow SSH to use options that run local commands.])
> ++fi
> ++
> + AC_ARG_WITH([ipv6],
> + 	[AS_HELP_STRING([--with-ipv6], [support IPv6 @<:@default=check@:>@])],
> + 	[], [with_ipv6=check])
> +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c
> +index b6f3130..6cc6c7a 100644
> +--- a/plugins/check_by_ssh.c
> ++++ b/plugins/check_by_ssh.c
> +@@ -27,7 +27,7 @@
> + *****************************************************************************/
> + 
> + const char *progname = "check_by_ssh";
> +-const char *copyright = "2000-2014";
> ++const char *copyright = "2000-";
> + const char *email = "devel@nagios-plugins.org";
> + 
> + #include "common.h"
> +@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)
> + 				skip_stderr = atoi (optarg);
> + 			break;
> + 		case 'o':									/* Extra options for the ssh command */
> ++
> ++			/* Don't allow the user to run commands local to the nagios server, unless they decide otherwise at compile time. */
> ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS
> ++			if (   strcasestr(optarg, "ProxyCommand") != NULL
> ++				|| strcasestr(optarg, "PermitLocalCommand") != NULL
> ++				|| strcasestr(optarg, "LocalCommand") != NULL) {
> ++				break;
> ++			}
> ++#endif
> ++
> + 			comm_append("-o");
> + 			comm_append(optarg);
> + 			break;
> +-- 
> +2.23.0
> +
> diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> index 471d4b42..cd89b329 100644
> --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> @@ -9,6 +9,7 @@ LICENSE = "GPL-3.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  SRC_URI = "https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz \
> +           file://CVE-2023-37154.patch \
>  "
>  
>  SRC_URI[md5sum] = "fb521d5c05897f165b0b1862c1e5cb27"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9015): https://lists.yoctoproject.org/g/meta-virtualization/message/9015
> Mute This Topic: https://lists.yoctoproject.org/mt/109817333/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


