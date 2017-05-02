Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70E83E00985; Tue,  2 May 2017 09:04:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.65 listed in list.dnswl.org]
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27BFDE00852;
	Tue,  2 May 2017 09:04:39 -0700 (PDT)
Received: by mail-it0-f65.google.com with SMTP id c26so3060999itd.1;
	Tue, 02 May 2017 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GM7m4yiFQBpK7TcMRucNaiJ/9UlTA85wNOZ9fg+Bcts=;
	b=hfgPNzF8NbQOKWEbLpv9qmhbKQXhLm3yzOT1GclVALf2PWs+UtxLJAk+Q6T16cfIyW
	wa3AggIRwWPgk2tbGjRnW4NBaGg2qgmdDRa7fYdTE3za5yKGSIMSJ+IM/gCgd86zHk82
	57wcnGUHzVmExQT4FzOaxYAlj1dDyG2WfMBdZ/u71S58slGLKJunbhlrFXEQOFIsTfpf
	449sExXg/xGzPWdYSu0uRBuGJCVpDN/SWjzeCCsDygXJ59uXdTGXMu2WBl+09qsPLIS8
	RT5gpuisJY3cY0jUe8C7jAB8AhF1R8UHeJML0BVL45EamGTQNJmEitaEWgUHOFBZWfea
	fpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GM7m4yiFQBpK7TcMRucNaiJ/9UlTA85wNOZ9fg+Bcts=;
	b=SPB6FYYzbs4AwqRgOqVY6O4yM6qnKybRUv00YEhPpyY/kJhKcUM1BG58BRaJ6+CCsy
	Bma5MpA0uMIJF2bnkEJ0Y+l324aJHbqFzFNJV9MdPQKbu45Y19L4vtTe2ilXp3cTltcm
	ULi1TNdQiw3w9W+EV2yC4TxWfkgf7+iFxMmVtS1tOjrODzzMVPfAuwentop+tzGcZVdG
	Iip7nXC7o2fg6Pt3LdCc/1nKwwNfv19unBliVxeJULWglnqOD+/nqjXQhxT+ge0qxvVV
	EwMT+5a8WDh3hiJJLVYd9fyaTKEbtMFJGSSRqqjJOEkt2HqcYZjIZxkgcnJIeNMFWeP7
	okdg==
X-Gm-Message-State: AN3rC/4FgkePYgDfndLp6rHYHiXj2yDEZEeCKmISexdDiCTlXOZg3daY
	bjtYl3ws2UqLz8Zh602BuT4FuCgBVQ==
X-Received: by 10.202.198.81 with SMTP id w78mr5174030oif.44.1493741079008;
	Tue, 02 May 2017 09:04:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.72.162 with HTTP; Tue, 2 May 2017 09:04:08 -0700 (PDT)
In-Reply-To: <b383700f-54c5-7ff1-92a7-89916c413f1a@gmail.com>
References: <CAFL6qn5czUYrKRLPxhZbj7EEAgMu_dFr89WNsDBaYxVWKppM_w@mail.gmail.com>
	<b383700f-54c5-7ff1-92a7-89916c413f1a@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 May 2017 09:04:08 -0700
Message-ID: <CAKmqyKPKbtGWsAKRQJPFwQ9hLE0_F1dYAcyn8gCecGaGvn2GjA@mail.gmail.com>
To: Jason Wu <jason.wu.misc@gmail.com>
Cc: meta-xilinx-request@yoctoproject.org, yocto@yoctoproject.org,
	meta-virtualization@yoctoproject.org, meta-xilinx@yoctoproject.org
Subject: Re: [meta-xilinx] xen-image-minimal testing
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
X-List-Received-Date: Tue, 02 May 2017 16:04:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 2, 2017 at 2:16 AM, Jason Wu <jason.wu.misc@gmail.com> wrote:
>
>
> On 2/05/2017 4:33 PM, Pello Heriz wrote:
>> Hi all,
>>
>> I have built an image using "xen-image-minimal" command with Yocto and I
>> would want to know how can I test if xen functionalities are correct or
>> not with Zynq MPSoC QEMU. How can I do this?
> http://www.wiki.xilinx.com/Building+the+Xen+Hypervisor+with+PetaLinux+2016.4+and+newer
>
> have look at the "TFTP Booting Xen and Dom0 2016.4" section and hope
> that helps.

You can also look at this, it is a little out of date though.
http://www.wiki.xilinx.com/Xen+Hypervisor+through+Yocto+Flow

Thanks,

Alistair

>
>>
>> Anyway, I have seen that sometimes in the QEMU terminal appears the next
>> message when the mentioned image is launched by "runqemu zcu102".
>>
>> INIT: Id "X0" respawning too fast: disabled for 5 minutes
>>
>> What's the meaning of the message? Is it critical?
> It is not critical if you don't need it. The reason you are getting this
> error message is because the your inittab trying spawn a console when
> the device node (e.g. hvc0) for Id "X0" does not exists.
>
> Jason
>>
>> Any answer will be welcome,
>>
>> Best regards,
>> Pello
>>
>>
>>
> --
> _______________________________________________
> meta-xilinx mailing list
> meta-xilinx@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-xilinx

