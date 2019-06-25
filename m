Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96015E00D30; Mon, 24 Jun 2019 21:11:28 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B629DE00D00
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 21:11:27 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id a21so14733916ljh.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 21:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yOR/n4vAdL8V0RyG7MGIybM3BydBBWTwkqCBw5MFyQs=;
	b=qHGBBfbOaja3z+T+15+Zjz04Ste+WepDxayh7the/3z+VETGXvS+8189xwFkjtCcyf
	1IfMLKwXFNlhxhvGG/kBjNLZDIHanHvsMouAzfS0nS9TbtDHE69599sW6MVgONlx5pyi
	daRQJfsxrRQPo0zpsRocLTM6HH9TSi1mvL0BUHEok8uFcVwr85rry5z+kaGFq4PHb5Mt
	CBo6V9G7fiV0bKx+a7VoMmeJUALibj0Z2roh86kPYSap8Z5LnVIzr6qkSra6S9oA9akq
	cPq21jhw5zOiUSgti/v+HHpgzVxJwqewK9MgnZbPB1HjA6b1n/onC9WRNJYaKVaHA9d/
	NntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yOR/n4vAdL8V0RyG7MGIybM3BydBBWTwkqCBw5MFyQs=;
	b=HHP9pMGAfHCACd/oGeuYOWetKKJdb2h0YSl4is7lj9IXgB+LbWGOUN7Nodes/AfGNr
	AWpcxfwZeSYo6INl8Oiwrs3gp0w18EWyTgovRZvV3uCqXoDO1lred/qOE0/TW9n1jNEh
	s8xXDp9UP7UPq96uPagDrtFQkUH2fEqUGTc+azAzhzLqrpiMHDBCDNzOKrTcyEpZiClt
	rDoOlLlQN9sbmqI7U/pe67VMhFnqnzXUiTKAcCoCldqMMx3z9Fdvzk2xddh5DO1BQ53I
	Tp0Aim4L+DI9XjfI8riUZ8bEMFlGAUWOGp6eKEUhRFB5FoG45+SgIFMUUJB5tLVGAuWw
	c0jg==
X-Gm-Message-State: APjAAAW3auJmWi636ijw6YsqESHvx0ZsDVIOlrCFncf5QR6KreC80xOk
	KVD1BMoDIg6JZ3gFsqjGWNHO1fdXrt8N8VJV8kc=
X-Google-Smtp-Source: APXvYqxOLbvZqXCS0XzKXLVtW9pX74XvVFK4/rc4kTbAWclwZo8zE10VPKv6/ZxjOJ7SIN3l7hH2kgy0SvZ8mxgh6gs=
X-Received: by 2002:a2e:98f:: with SMTP id 137mr9389876ljj.232.1561435886609; 
	Mon, 24 Jun 2019 21:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <1561084277-143761-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1561084277-143761-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jun 2019 00:11:15 -0400
Message-ID: <CADkTA4P=y9yQKjCP3kkf2MOJMim_488HQAM5M_v+vc=3VmHDJg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] glusterfs: recovery original author address of each patch
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
X-List-Received-Date: Tue, 25 Jun 2019 04:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 20, 2019 at 10:32 PM Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch    | 2 +-
>  .../glusterfs/files/dependence-on-correct-header-file-path.patch        | 2 +-
>  recipes-extended/glusterfs/files/glusterd-change-port-range.patch       | 2 +-
>  .../files/glusterfs-api-remove-unnecessary-library-options.patch        | 2 +-
>  .../glusterfs/files/glusterfs-change-default-nfs-port-number.patch      | 2 +-
>  .../files/glusterfs-configure-automake-with-subdir-objects-for.patch    | 2 +-
>  .../glusterfs/files/glusterfs-disable-default-startup-scripts.patch     | 2 +-
>  .../glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch         | 2 +-
>  .../glusterfs/files/python-work-around-host-and-target-python.patch     | 2 +-
>  recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> index 4bbcbe9..bcc4319 100644
> --- a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> +++ b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> @@ -1,5 +1,5 @@
>  From f2a1c67e2b3b60ba54f506cf806437924b5242ca Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Tue, 12 Mar 2019 20:21:48 -0700
>  Subject: [PATCH] configure.ac: allow PYTHON values to be passed via env
>
> diff --git a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
> index a4b01c1..a1a6a65 100644
> --- a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
> +++ b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
> @@ -1,5 +1,5 @@
>  From 204149d9b46ccec3a354ad4cfcc230c1fab93982 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Xulin Sun <xulin.sun@windriver.com>
>  Date: Tue, 12 Mar 2019 22:04:12 -0700
>  Subject: [PATCH] dependence on correct header file path
>
> diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> index 3458d8a..daa9680 100644
> --- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> +++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> @@ -1,5 +1,5 @@
>  From 59d1b6fb5e6315df9fc55a74576b1bfde30303f0 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Vu Tran <vu.tran@windriver.com>
>  Date: Wed, 24 Apr 2019 23:07:58 -0400
>  Subject: [PATCH] glusterd: change port range
>
> diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> index 32f4dc1..32da618 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> @@ -1,5 +1,5 @@
>  From 2b55524fab066cb14880a819f570b7f839bae1ce Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Jim Somerville <Jim.Somerville@windriver.com>
>  Date: Wed, 24 Apr 2019 22:44:12 -0400
>  Subject: [PATCH] glusterfs-api: remove unnecessary library options
>
> diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> index deb9e45..9d5d7c1 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> @@ -1,5 +1,5 @@
>  From b8b48d3c4ab92ce167db8137426fad45e938b11b Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Vu Tran <vu.tran@windriver.com>
>  Date: Wed, 24 Apr 2019 22:50:01 -0400
>  Subject: [PATCH] glusterfs: change default nfs port number
>
> diff --git a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> index 6278ce6..50b012b 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> @@ -1,5 +1,5 @@
>  From fcd612f75c2e99a0748bebbf530b730d0019d2bf Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Xulin Sun <xulin.sun@windriver.com>
>  Date: Wed, 24 Apr 2019 22:33:49 -0400
>  Subject: [PATCH] glusterfs: configure: automake with subdir-objects & foreign
>   parameters
> diff --git a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> index 7f582dc..c8e0e7d 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> @@ -1,5 +1,5 @@
>  From bbc23b4723a5f60f2b6f4daf734194f9a3a315d8 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Donn Seeley <donn.seeley@windriver.com>
>  Date: Wed, 24 Apr 2019 22:41:04 -0400
>  Subject: [PATCH] Add the glusterfs package
>
> diff --git a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
> index 660446b..f5880ea 100644
> --- a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
> +++ b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
> @@ -1,5 +1,5 @@
>  From 732bcca9f5fbb6defca8c327744d015d6747864b Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Xulin Sun <xulin.sun@windriver.com>
>  Date: Tue, 12 Mar 2019 19:56:59 -0700
>  Subject: [PATCH] libglusterfs: Don't link against libfl
>
> diff --git a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
> index 700b0ba..e8f99ac 100644
> --- a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
> +++ b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
> @@ -1,5 +1,5 @@
>  From 80c38519224635e9fe2a21542b7dbb14e4c16dcc Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Tue, 12 Mar 2019 19:46:27 -0700
>  Subject: [PATCH] python: work around host and target python
>
> diff --git a/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
> index ed11ce5..346eb71 100644
> --- a/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
> +++ b/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
> @@ -1,5 +1,5 @@
>  From a18891a9807b209c7c0811e0e6ca08c4570809d0 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +From: Donn Seeley <donn.seeley@windriver.com>
>  Date: Tue, 12 Mar 2019 22:00:46 -0700
>  Subject: [PATCH] Add the glusterfs package
>
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

