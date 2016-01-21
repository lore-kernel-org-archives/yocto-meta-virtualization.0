Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29D7FE009C5; Thu, 21 Jan 2016 08:05:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.173 listed in list.dnswl.org]
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3AD9E0085A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jan 2016 08:05:44 -0800 (PST)
Received: by mail-io0-f173.google.com with SMTP id 1so58754961ion.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jan 2016 08:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=noe0ZhfoSfcwWyZdN+9ieJf8t+kwZqxxW+mmiVlj/4o=;
	b=RA1W3KeuEWzAM9LZh0AA0kkGX6X/v+QIrT7rOUPOB1mOS0bgPIPyMsYXI8jOkTiiLI
	RPuUtCoU7QdaNl6THAMXBEq8+9l1T0vFasIIL9a4p9QmSD4+sjuXYqx2Ox9UhoR1Ymf/
	fmKQWg+1YKYXEZMVz9gzevWOGqBWa1/haepwlYbWYIK5E7kRmSKdepIgiH0W5SRM/bmR
	UbbRWf8r30k2OAmDsXMs61fHXFese3OZDZpX4E2oTvaNDyNhYSVPYRsrLcWshtRzzeLV
	BBWV0emfDVmBZHNzwldpvH7mkpk6AJYzLfTwLZgevMOftNcD0B3un22PRk0gD/SaBTGh
	CyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=noe0ZhfoSfcwWyZdN+9ieJf8t+kwZqxxW+mmiVlj/4o=;
	b=jnrlae1XfmhKxFZ17JHM1Fh3Rk3Trg2c9KQUg18MhnkJ30cx3ExpGIkw8tCj/xmmb5
	FM16EPH4ykOXHhGO0ufpH21vv6QBCuNGfVOXJ6YV3NC3F4G+pqRQMV5lHwT3CjQxa6tS
	0/lcKwYFXn5tM2Zd9p6dsn7lXNENEc9YLB2pj5MawnAUfiwn6k63WQ++5ElaGM/Ua0oK
	ovaX/W2e8F2daaeBix3/Y7oPOLeuRHsOaWPMTeEcwbKGkNMl86mVErPRQBNfgTfBcj04
	irJhK3W4J+p8X8K2j/DTrHmRrQ95d5sn14/FfGpXZsMO/cMTY824Ptx4AHlEW7wwhdvO
	Pm4w==
X-Gm-Message-State: ALoCoQkzgXjbU7anX+5HLYcLWCgAPlkHfuz/hfz3izObODZu3flEfM2ycn27EENo6QEmAJyADMnUnLb2i81W1Ly1r7YcjfHk9g==
MIME-Version: 1.0
X-Received: by 10.107.12.22 with SMTP id w22mr46219735ioi.8.1453392343423;
	Thu, 21 Jan 2016 08:05:43 -0800 (PST)
Received: by 10.79.115.5 with HTTP; Thu, 21 Jan 2016 08:05:43 -0800 (PST)
In-Reply-To: <CADqm_SSvTkVDrHku6a_MZww-KaeQ+SamzgNvXSZ2tUd_RbJ0LQ@mail.gmail.com>
References: <CADqm_SRdKySYQwvUMepd3uVvYzLW+Qd6tc77k616h3BiTe5-NQ@mail.gmail.com>
	<CABZSBQe3AnzvwfW-x4Fum_AoHYn2OO1VD=YEmmRkNhJmZGOcSA@mail.gmail.com>
	<CADqm_SSvTkVDrHku6a_MZww-KaeQ+SamzgNvXSZ2tUd_RbJ0LQ@mail.gmail.com>
Date: Thu, 21 Jan 2016 11:05:43 -0500
Message-ID: <CABZSBQeNbXniYMV4PAHrc=MuRMMiNorfbuczmVLjaE3yEnKJuA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: "McGillion, Brian" <brian.mcgillion@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Failure to build xen-image-minimal
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
X-List-Received-Date: Thu, 21 Jan 2016 16:05:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 21, 2016 at 10:05 AM, McGillion, Brian
<brian.mcgillion@intel.com> wrote:
> Hi Chris,
>
> Thank you, that was it!
>
> In general should that config not be part of the xen-minimal-image recipe?
>

The DISTRO_FEATURES is more of a "global" variable and the scope of
xen-minimal-image is not sufficient to get what you need (in this
case, affect linux-yocto).

Perhaps we should document in the README?

