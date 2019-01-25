Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6235E00AB0; Fri, 25 Jan 2019 05:33:02 -0800 (PST)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92A95E0053F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:33:01 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id q2-v6so8372343lji.10
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V7qenXOruQULmgfWxKDwgvbaNvcft4I5hRr2RuBV3ys=;
	b=JpXCkqc4bYDjdds1q1wpnDzdrgcjtQy8AJFO6TvoCXqilUOcFvfhXMzGhbuBlZsiWE
	QBdB3DuWaitprl0SmY9PXQEtNwUmeDFgN3n/7w/3Jc8AbwbnFUXaBXEWzBQK/rMbCOPo
	f40JptRUH31XUlrmr+2B81CMl/46ItZBA55WzG25jA3aVC5M3oQ91OLljR0ZB2H+hIRT
	nsp8iFCj9KynN9K+si4XLkrk1vzXWc1IAb0EYbQRPOEdOkaSayCRFvyexz0D0yNvL+J3
	WZEwVysU3g7g4E3Vb0VgTZ109lUfDq6NtJ6CpOU7raIaQGQOJJuF415qv0KkOGadJS0w
	dDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V7qenXOruQULmgfWxKDwgvbaNvcft4I5hRr2RuBV3ys=;
	b=H7qhoZUBulyIobqjVX5evM+oqkdEpblS4+LYPDXYx4cpcbuj7ggS+Jnfe/HghG1jkX
	kin/iP5/T+KUU2QeF54WLLgd9Sh2b6rKrhxfpm2d3PLAZkaq5ESMjCRCy/GQx682wcSr
	IPjvtelEPTqzxF4i6SkojfDCXi7JH3VqkGaBFHd5lTTnv1H5/qUDRRa673iFnXxrU3Ic
	YVE2iq1rFCCtkZA3gFA/qeUK0C8g0PhtyJgEP/4cHUrWzcq41KW9IkcxhI+mUCwerw4W
	iqm9nlEHGyzO2O9DByQvTMOh0MYuVCWpqFbBV6/UZimozPUbLrJNO2OvG7Xcm57w3AG6
	j+jA==
X-Gm-Message-State: AJcUukfW7t08g9aqImsHrdoUBg9fVXmlkWDOh+ZlLQ2t6J915L3uE7yR
	c9TGWpmWQDDwRDDHmq8OAZ27BpzQ7cEjolv1vhODXz/Q
X-Google-Smtp-Source: ALg8bN5ptYyGxGiKlNVjKa/dKyAkwxxTGPNUUJNqT4lHyNFQJR+v/PdMQuYd7LRqITN9o4HmCXnGqTwqLpsGszlKR9o=
X-Received: by 2002:a2e:3012:: with SMTP id
	w18-v6mr8827196ljw.75.1548423180238; 
	Fri, 25 Jan 2019 05:33:00 -0800 (PST)
MIME-Version: 1.0
References: <1548380842-203766-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1548380842-203766-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Jan 2019 08:32:48 -0500
Message-ID: <CADkTA4NRDvno4cv6VhCHN_Q4_F1gRkVUcrDQuKRDnTyP32mJjg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux/docker.cfg: CONFIG_NF_CONNTRACK_IPV4 was replaced by CONFIG_NF_CONNTRACK
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
X-List-Received-Date: Fri, 25 Jan 2019 13:33:02 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jan 24, 2019 at 8:48 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> kernel has replaced CONFIG_NF_CONNTRACK_IPV4 with CONFIG_NF_CONNTRACK.
> [commit: a0ae2562c]
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto/docker.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-kernel/linux/linux-yocto/docker.cfg
> index 4ee8e36..79012a6 100644
> --- a/recipes-kernel/linux/linux-yocto/docker.cfg
> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
> @@ -1,7 +1,7 @@
>  CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
>  CONFIG_IP_NF_FILTER=m
>  CONFIG_NF_NAT=m
> -CONFIG_NF_CONNTRACK_IPV4=y
> +CONFIG_NF_CONNTRACK=y
>
>  CONFIG_DM_THIN_PROVISIONING=m
>
> --
> 2.8.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

