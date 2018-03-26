Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4F78E00A75; Mon, 26 Mar 2018 11:11:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5047E0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:11:43 -0700 (PDT)
Received: by mail-yb0-f193.google.com with SMTP id z5-v6so6695647ybo.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=LrXjt0wWUFmAvddN/yBA+USXmzvJzZHsoq1sLEZxJ5k=;
	b=COqX0jyywSHOih6ZWV9kAQkebSQyGX+qON8J6QEkXidTU1n6SZhqVmtnpx188qEkU7
	gw8deWqKS+9VAfU3xVaStMPuRmcvcZ6831T8KJ+7Zb/EAzQvQVeXy4Jao+QgD27e5OIV
	eYTMf6oOL0UmgsUqmrIc3gAnYcVv/XK+H7C7+qCcX2uT/PElrbYFUYnEPXobZIf5uCmW
	Jm655bAzHZajpmCkptD2DjIwIFNCoY2lu1Sdfi6UKWO1wLUrcl+7Tp4Gem6oC+Ux/JIA
	jvI+t+Q+0UyYNASOBCr4i+vlY8bRG1EM3gvqTH/A5lzJsIXdWSyyAt92kog6BH5bo0qR
	+qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=LrXjt0wWUFmAvddN/yBA+USXmzvJzZHsoq1sLEZxJ5k=;
	b=oWPMwJ869y4lkJi8P5oHeD05K86NXhvDJcRshj6XZRYG48YU1ja6NrEK8qlQOVkv3J
	8G4Dzpo+MCwy9IQs4NiLcmm/atDV17+vKoM8udthS1FbhQUAjiERWIiTtpXVmmdQ3qCL
	gbp4uTQfDAUFSqGjSwXMrsIoLUS8TZbYJlFfD01hAL9t4u8ILjJDQVAVNfijk/ZzDUZ7
	nwd3cmS9AyplxBKYt1ol3fF6ijzmck8ob9o75HP95y2jgbb4HNw+oWRFLPMFe7Z0Ya55
	7+eUe9kA4oMmGRPP1zw9vQxeDfJ0YSGHcQDsIwFDzda3fkX29e7Df91yrvtIQY6nCIbw
	lc4w==
X-Gm-Message-State: AElRT7H5+ix8UgEBfYP3GyGEbRbVgPNkBbXTbLM9/qe43H7qrOs5RMwj
	dwHkMGiOrvDk2nWvI4XbC8GyooQ+tWjOHYswjanwJw==
X-Google-Smtp-Source: AG47ELsmkC6TAgyrMRp1NpP2DbE7pAddBOvz2dPEHVyEZ/GjFiN1KaF+IWn0B5X92HDCzPHUsO9SAX1Tl07F67xwzeQ=
X-Received: by 2002:a25:a2cb:: with SMTP id
	c11-v6mr18300707ybn.431.1522087902484; 
	Mon, 26 Mar 2018 11:11:42 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:11:41
	-0700 (PDT)
In-Reply-To: <1521775736-38102-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:11:41 -0400
X-Google-Sender-Auth: QJiXWFeq4a5K-5L7HR85yDUxvEE
Message-ID: <CAPuovE+THXV_cQdh-jHkv6kX_hTkAmSWR0qz_Jqfj1pniQ_NsQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-mox3: 0.20.0 -> 0.25.0
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
X-List-Received-Date: Mon, 26 Mar 2018 18:11:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-mox3 from 0.20.0 to 0.25.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce, this one should be fine. I don't see any version issues with
current/required packages, at least after a quick inspection. If we
run into anything in the future we can revive the old version and use
a PREF_VERSION.

Mark

>  .../python/{python-mox3_0.20.0.bb => python-mox3_0.25.0.bb}           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-mox3_0.20.0.bb => python-mox3_0.25.0.bb} (75%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
> similarity index 75%
> rename from meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> rename to meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
> index 95ed6e1..062fc7c 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "53be7bf2d109c8bdf477c75b369773b8"
> -SRC_URI[sha256sum] = "7b1549222353f6cc5b705734ef186fe2cc323d30c3987df50eceb77273595606"
> +SRC_URI[md5sum] = "77bb9a6a57187b708d822bad05c51e0e"
> +SRC_URI[sha256sum] = "b7476f7a2dfe4d7ad743e3cbbf04ade624b3a208a0042f3f8b2ae7b00559543a"
>
>  inherit setuptools pypi
>
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

