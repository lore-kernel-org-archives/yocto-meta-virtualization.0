Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C86BE009AA; Fri, 25 Jan 2019 05:33:13 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95D10E0053F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:33:12 -0800 (PST)
Received: by mail-lj1-f195.google.com with SMTP id n18-v6so8372696lji.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9coOgi/oQh/IKG+JWwxgS4ByDqnD7Phc1fD/HHTiMDs=;
	b=AbnrqsvrZEw26D+EvChC3wKP2nb4sXWHnEwlN52YcY1g44T0VVyoscxJorC6NDv9LD
	Cncqi+P7JPjqN7LWedJaii0B9dUBnpJsjUU7lHrskikUko0ocv8lRgTl9nJ+oqVk6H6X
	1Y1qXi7hu/oGQpDMx4hWJWoJ9LbYXSNADkqttdt+RrYHyZymrKSPwKP3mv+h2F0y7q+5
	I0tletilVBGTWml8vxAOyQQ0lcos3MhfC9+xwenlaEBW67FfK/z5EnUklBdOAQe8A9fN
	9T6iVvUcg+1zERImojkqWDSTWgWarj34r8yMe1mOhf2LfUxWlzvKxABwSkU3d3zqGxAc
	HCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9coOgi/oQh/IKG+JWwxgS4ByDqnD7Phc1fD/HHTiMDs=;
	b=scV6p2XZp/fx+yzMnceVUaFI4JzKGbx8ixwRoh3p4EznapL9eq9/Q2zW8/seuzHBb0
	7CTV1EaNdD4Zmze1FmRvBjVu0xRaJp9RxxbcmXAM1EO0m3WrxykAKb34arjCflKYJC3I
	o02nSeMukC+3Qq4I2U2ov6zfUABxro6eaiF57qyjjxrcOSwaKyH4DVR+q9Pvc6w05kv2
	6Xb4SL1IJtjJZPlWObZAgrQDjelpsAqiGbBG0xg+T6iWO9YTD6E3MNdBhWZNSq48/ipN
	ZKT1f5PVJlsjOd5LhgxfZbfazkVfs1P7pML0RvnuaUh2BnMCj5sjEufjX5ZBu/2C9wSG
	0eKA==
X-Gm-Message-State: AJcUukfAeteAdVxp7DfG4MTWzdy1dN3M/O2YUsfpbaQxiTM7H5N2WPXd
	ZXIaexSptHUVk85tmhSVES7/+QVD84UfLCKydVUe27qZ
X-Google-Smtp-Source: ALg8bN4zRew+bvxXgXLruB+HqQPhJxfcjnfnEOIjAEQrkoWMT1q+mTzo7P+wxHqknMJkG+Ma0zdzEO1SKwCgCmchfaM=
X-Received: by 2002:a2e:8554:: with SMTP id
	u20-v6mr8883895ljj.193.1548423191245; 
	Fri, 25 Jan 2019 05:33:11 -0800 (PST)
MIME-Version: 1.0
References: <1548402978-210062-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1548402978-210062-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Jan 2019 08:32:59 -0500
Message-ID: <CADkTA4OptWgQhQ3Ko16vJOnfgX+Fq1eJjus4ZRH-sza=EYqJQg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] linux/nf.cfg: CONFIG_NF_CONNTRACK_IPV4 was replaced by CONFIG_NF_CONNTRACK
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
X-List-Received-Date: Fri, 25 Jan 2019 13:33:13 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jan 25, 2019 at 2:57 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> kernel has replaced CONFIG_NF_CONNTRACK_IPV4 with CONFIG_NF_CONNTRACK.
> [commit: a0ae2562c]
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> index 223210c..1bf82ea 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> @@ -2,7 +2,7 @@ CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_NAT=m
>  CONFIG_NF_NAT_NEEDED=y
>  CONFIG_NF_NAT_PROTO_SCTP=m
> -CONFIG_NF_CONNTRACK_IPV4=y
> +CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_CONNTRACK_PROC_COMPAT=y
>  CONFIG_NF_NAT_IPV4=m
>  CONFIG_IP_NF_NAT=m
> --
> 2.8.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

