Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD6CAE00890; Mon, 27 Mar 2017 09:05:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.169 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.169 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B97AEE007AA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Mar 2017 09:04:59 -0700 (PDT)
Received: by mail-yw0-f169.google.com with SMTP id i203so34797184ywc.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Mar 2017 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HgIp3ep0+tVF5YC76FQCBkrz/7AH/F8qTRs7OgwfBas=;
	b=fnYivSBYCtqqpZh/kJ/DhhgGWE8+ZPes5VXcsEZWThBuI8JF2BOLkP7rrUprtX/PPp
	VCh8wHgLn8vglXNtfqeA+qcbeIKyvA+FXfh77epPU3rcS9JauDYhWl6tr70bZMMjFhf4
	PVTex5IfTBrcr7dy7nALq/vNrJdeANcPsdmjXsx93wEFUXmdvGseyoesrUff3NkzlnAW
	9eRXLK77AqA5u1REpOF3Ep8/yqDSWLL8wdRMHaEI4spn0rAoD3x/clETisnbQN/5QHPh
	3AP59a/34313X4vE88djyC4/vWUILLW5mPeQh0pydjlRXWuxoSJYU6RCoDyn1nhGg0lL
	WufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=HgIp3ep0+tVF5YC76FQCBkrz/7AH/F8qTRs7OgwfBas=;
	b=FV1nLRsupCcUmGptPT8io2aP04M4kBENzh+PZhRLuZhGYvD82M4/v1pWXGADND5N+9
	J6H4LMqThtqfM0H/KylAP65cMMCVzLM+4XdeeRXJ0a9Y2URHdDTqMwNgJxVjcRgzxu+i
	8LA/VSgMeWqC7dfypeLgJ2fk0TwS5vnvq5u6ypx1fU4aC7r3KU+RguKHuQ18S9Ocr9qb
	8r7oxHnPQ8DMyFDtLNzQ+0KMBdn0CFqyPBWuPt7SVHWUAAoUmabTMTbMnxEfLqyrzjEm
	49xXYJrkDR5Xx9Y+PAcKQ98u2dyy0cQ9O3EQA17aUYH7eI1sEUacj7uQOFV3sALiZd59
	sedg==
X-Gm-Message-State: AFeK/H3qm/dmLczJtecCFZuLbGp61T5Nv0TAzOVxvHV7ljQhAvdcysl1UC2OtRUpdtNxw6iPrMnuNlSJD9reVw==
X-Received: by 10.129.157.202 with SMTP id u193mr20037433ywg.12.1490630698415; 
	Mon, 27 Mar 2017 09:04:58 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.49.194 with HTTP; Mon, 27 Mar 2017 09:04:57 -0700 (PDT)
In-Reply-To: <CAFL6qn5NxqSjVxZnh6mwXvTK3gw3MQB=VZtqyU=q9cS1s033Zw@mail.gmail.com>
References: <CAFL6qn5NxqSjVxZnh6mwXvTK3gw3MQB=VZtqyU=q9cS1s033Zw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 27 Mar 2017 12:04:57 -0400
X-Google-Sender-Auth: Rr4-reutilk84lLCvVKBuHbNNqE
Message-ID: <CAPuovELtCH-6qeLYxyJ4pLwTK+kafKOHOLo4r+n9jzdU8+nVhg@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Virtualization support for ZCU102 on Morty
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
X-List-Received-Date: Mon, 27 Mar 2017 16:05:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 27, 2017 at 2:49 AM, Pello Heriz
<pello.heriz@alumni.mondragon.edu> wrote:
> Hi,
>
> Is it possible to build a xen-image-minimal (that requires
> meta-virtualization support) for ZCU102 board using Morty branch of Yocto?
> Is there in this branch enough virtualization support for this board?

There is very little in this  layer which is board specific. There are
definitely some overall Arch considerations where we have focused on
X86-64 and ARM (and in part AARCH64) but those can quickly be found by
the "does it build or not" test. You will definitely need to work on
ensuring your BSP is building with the correct kernel configuration,
but this is where the Yocto kernel and its use of kernel config frags
should come in handy. You generally only need to focus on hardware
specific configs and the other frags enabled in this layer will ensure
the other things that are not BSP specific are enabled correctly.

I can't speak for the Xen recipes found in this layer, these are
submitted and updated by folks who regularly use Xen, which is not
touched by the usecases I am involved with.

Hope this helps,
Mark

>
> Regards,
> Pello
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

