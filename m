Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5F1EE00B28; Tue,  3 Apr 2018 07:04:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34512E008D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 07:04:55 -0700 (PDT)
Received: by mail-yw0-f177.google.com with SMTP id z82so6160003ywd.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ibljPXijZeVQLqtMXKY3i+rVK42Szjb1RGgi2a5h5GE=;
	b=UsmYwYX5lymNvEsji2aUMZgWpQAD1SYp67s5k/3+V2oowFxTDdu1fKDtogU3mhGBVE
	D76+ZC0LbcHV8iSa7FqgKkfpF8jy2OlccCR8jq3pV72Z8hm49lMG5KXM9nx5xde8ug7e
	Qb0O3pPjOw5BrZor0LOlN8td4mFgeQe81KISDZ+5PuOM9ouz4bm/25wr+E8Jwz0dM0nY
	4G44OS3pIYsEVVQT4IJTMTlY1zKS0cMXHM3ZFVcwWvImLq9Aj5t8wAo3EyRubnFeo3aE
	n3zs3A9AbNyOBKiAO9Qz0hGzEBzrEVQTro4C1xGrU510yvrZtshghEkx1cnJ5kdIapqk
	3njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=ibljPXijZeVQLqtMXKY3i+rVK42Szjb1RGgi2a5h5GE=;
	b=XycJvdZ08YeMa/RZ4HlCUjLplTKjaJfOJLN7UK+VLCOoLJyyxMnrwU6lJvSJgGjHmb
	08cu2xOVodpYxFf5sE38YvouiBH+SIlKOawlXa9UJodsJgz+t3DeDgJRzNUViZJTCCTN
	oKa6h8jdnAK1C8GNDUQTCG+uJwUYRqZVRly9faVOVpjqmzBLGv9ojyAKyX8Obt9UsjJn
	WXQJhpusfLOmdewXbJ8id3rw/gDRaHTi5iSceA3FNxOewiS5HlZGngANAM3lqypohJ/Z
	svozyd3wLz8yCsdPHwj9L65D8g2GgUbB3oAkl95HjsvkC6Zd2qNqu/6Y0o/4l2wGGa5V
	bU1g==
X-Gm-Message-State: AElRT7HWXWzpqWmKYhe/Di6ddR49OANqGWupKQsWokv4qRXlM0cqdgIM
	gN+yYyF7wKRl8fBaPz9GdOxe+pWC4TLEGNOmjAo=
X-Google-Smtp-Source: AIpwx4+lryZr/ECEj9veXUI/tdRoYlAs6XmKIdXmkjJnoJrVLmoJf8bkCI5PanF8n1z06el7BaHauTIEQQ6r58rQwUQ=
X-Received: by 10.13.212.200 with SMTP id w191mr7823688ywd.210.1522764295411; 
	Tue, 03 Apr 2018 07:04:55 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP;
	Tue, 3 Apr 2018 07:04:54 -0700 (PDT)
In-Reply-To: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 3 Apr 2018 10:04:54 -0400
X-Google-Sender-Auth: C80T88JH7ob_1TvwBr5YpHbMCUo
Message-ID: <CAPuovELeRZkqRve4p_vPsnUWTMnzs8kgsbuTJAgCmWibau0Ftg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-testtools: 2.2.0 -> 2.3.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:04:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-testtools from 2.2.0 to 2.3.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce, this looks safe to merge.

Mark

>  .../python/{python-testtools_2.2.0.bb => python-testtools_2.3.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-testtools_2.2.0.bb => python-testtools_2.3.0.bb} (76%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> similarity index 76%
> rename from meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> rename to meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> index af93ea8..bbf1d01 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
>
> -SRC_URI[md5sum] = "adef817b07ba24fd6d807fd41a4f1ef4"
> -SRC_URI[sha256sum] = "80f606607a6e4ce4d0e24e5b786562aa42c581906f3c070607a4265f3da65810"
> +SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
> +SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
>
>  inherit setuptools pypi
>  DEPENDS += " \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

