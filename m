Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D6FAE005B4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Feb 2014 11:43:07 -0800 (PST)
Received: by mail-lb0-f178.google.com with SMTP id u14so12804571lbd.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Feb 2014 11:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mlZ1VSYBhtlQOErQdo5DvxsXKXxZTyT9AE7MxP5xhxM=;
	b=kkJIW0jEsXrMoP2ZrtbWWHkLOdtKj8/K/5AUb3wSiwA27C0IaYyu8y18QKv0ZSSyqt
	UhM0Be6+fr13OtwQjTrE5nz33ikIlLtkPRaAazW0PIfYY8qeTbwvslDf2p2dP1VPf2qH
	wXOJ3Idxl4JH/8F6R0a1gAJL7dpIe2hp671LvPZAqC4QscJh04AKKo1KdtutWawGKh2/
	kyEuogUHG+YVP1vJXlV/3J5uwzJwfVYqBDjvmedq+Rq+EgRI2N/FLWWDqI/NRHre+GQF
	oAXhyQt5v+HdUpA4tm1Ui7/GiVdMzqmtEHWlsMIQd9tMdSw0ex+8HuRz1tBFPpwKkmQy
	dvtQ==
MIME-Version: 1.0
X-Received: by 10.152.22.102 with SMTP id c6mr23282302laf.27.1392752585918;
	Tue, 18 Feb 2014 11:43:05 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Tue, 18 Feb 2014 11:43:05 -0800 (PST)
In-Reply-To: <CABcZANnw7DPih712ZFdSaGaghPztgeBsUEW6LV_oQxUCMGAV_Q@mail.gmail.com>
References: <CABcZANnw7DPih712ZFdSaGaghPztgeBsUEW6LV_oQxUCMGAV_Q@mail.gmail.com>
Date: Tue, 18 Feb 2014 14:43:05 -0500
Message-ID: <CADkTA4M=DTb_VVtvOWg3G3A4kXnpQfrutOh50J=n6+k3jPhurg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Regarding 7499d6c in meta-virtualization master branch
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
X-List-Received-Date: Tue, 18 Feb 2014 19:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 1:03 PM, Chris Larson <clarson@kergoth.com> wrote:
> FYI, the recipe was modified to add a patch to SRC_URI, but the patch wasn't

Argh. Thanks for the report, I just pushed the patch :)

Bruce

> checked in.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

