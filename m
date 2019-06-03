Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B671E00D44; Mon,  3 Jun 2019 13:09:00 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10495E00B33
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Jun 2019 13:08:59 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id o13so17467843lji.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Jun 2019 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4RvcdDn/Tbgayexpck8o1WoX+6jBowy9KnMhZjelfgM=;
	b=sFSFa3148tHFsjLXf0IT4ZlWy1ujHBNqpjo4/HYzhWJ2/6BN6yklhm6K+p0HzPKhlI
	kpeEFW0mdSn98VDVPvn7uXne4Cj3LPR4m+1S1HongyYrIIb/QubBkMxSTbngZMEzbsUB
	NS1L6DgooaSm2xMjsLJdVW7dkhJG60JNVSiwC7edE8XcLFZixizPdMBLwOrTG+JeOO60
	VZM1HAuRvJfJzyXyXG0PY6xXyUn7ur4Cy3DUmq1OJGMadI9zw42k9W8uujPY1oZt9bMk
	e2gIv4YTjO7+0a2teFpdWhfRZVF/r7p0Wzt6prWPBv6B3O961mBXr3GQBf1BFHIFhzVY
	DtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4RvcdDn/Tbgayexpck8o1WoX+6jBowy9KnMhZjelfgM=;
	b=YBt8/Hv2IoU9wGIGXs3BOxMp6LSyuNU4Ag3j59SPOb3IQv+rLBjZX9hPcIqS4zoVgM
	jnNmSWDB4OaE2jHgxi7FIl23ywPnc9OmF8Se5/TGfJAkCYRR2+SdXSSNJRk6Z2v2myEY
	EW3gEe1AFTZrRUvrks26U9LKnKgNEyaykOr4h+GlE+YYhmCAwEOPiYk4so1+iCqpw0qM
	Pt9rMZWZT/efFIhwJkVz4YcUYYXLVQVR5RblavaoWKwoGw0xxwwTG8rTxSALingP7G7d
	IA8LFGkttbRRAHoD2FaJ0vf8mVyfTmY3Xxme+gk3Kj2hsNFz29ViusV/8Qo5UFYn62at
	ZY5g==
X-Gm-Message-State: APjAAAUlIDUnY+T+k4oGphLdcQ96IXhdAMfkSmmEyhb18dStCtHWaamZ
	1Nv7SBRkFUhG2af2dSfbR6duHdDtCidTfizr6Do=
X-Google-Smtp-Source: APXvYqzRGDpvOB96a/ourRYUjwSWmRaNflo94um4TkiKohDMghj42lDFc/b3GfbkPkN3fuTp6JIwjZPnvLGWPnyBLwA=
X-Received: by 2002:a2e:9185:: with SMTP id f5mr11809696ljg.51.1559592538891; 
	Mon, 03 Jun 2019 13:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Jun 2019 16:08:47 -0400
Message-ID: <CADkTA4N89RpjfFfPYG52UGCMOc8kJ3J3Rj02uMVyUfdwbK3VDA@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH 0/4] update bbappend to match bb version
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
X-List-Received-Date: Mon, 03 Jun 2019 20:09:00 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, May 30, 2019 at 1:48 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
>
>
> Hongzhi.Song (4):
>   iptables: update bbappend to match to oe-core version
>   libvirt: update bbappend to match bb version
>   linux: update bbappend to match oe-core version
>   iproute2: update bbappend to match bb version
>
>  .../recipes-extended/iptables/iptables_1.6.%.bbappend       |  3 ---
>  .../recipes-extended/iptables/iptables_1.8.%.bbappend       |  3 +++
>  .../recipes-extended/libvirt/libvirt_4.%.bbappend           | 13 -------------
>  .../recipes-extended/libvirt/libvirt_5.%.bbappend           | 13 +++++++++++++
>  .../recipes-kernel/linux/linux-yocto_4.18.bbappend          |  9 ---------
>  .../recipes-kernel/linux/linux-yocto_5.0.bbappend           |  9 +++++++++
>  .../recipes-support/iproute2/iproute2_4.%.bbappend          |  4 ----
>  .../recipes-support/iproute2/iproute2_5.%.bbappend          |  4 ++++
>  8 files changed, 29 insertions(+), 29 deletions(-)
>  delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
>  create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
>  delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>  create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
>  delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
>  create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
>  delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
>  create mode 100644 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
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

