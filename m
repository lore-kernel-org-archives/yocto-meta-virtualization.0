Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4324FE008F6; Wed, 25 Mar 2015 09:47:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AB28E008CF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Mar 2015 09:46:58 -0700 (PDT)
Received: by igbqf9 with SMTP id qf9so30543277igb.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Mar 2015 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=fK4KVqrmCovEEfBV8OtHggMKCr6boUwfi0WTvrAveoA=;
	b=LalUNhMyewQcGUIIlzkhOZk5f/By6QDGBssB1gKpMQFTwxzenb4iCsSH1/2nDXxnu3
	7M2jOCz3gMqs7qQp7SUJrMC1BiC2DFHzPN57qXRVV5tRWj6hXk91vH5DlrL025VRSXJx
	nBrmpsE/nS2VKI2+rMa5IUZGo5rEq2aL1Rqigqi5UiXGj1ZAnAuFn/wACfFdfrO21Xwx
	55i1RlBuqeJw+YX2TCaLfeAPLMwk3d0VLgfkGJNvotQwZhbjlWMBt5ah7WdVprGevnvj
	Ec44vJ7+mDcfMBRbT93qSQn1AEzWGfnRk3Gb1RSbAmZirfbN6yjQR/WSyLwKpqXnbQU9
	T0Ww==
MIME-Version: 1.0
X-Received: by 10.43.64.203 with SMTP id xj11mr33911311icb.54.1427302017403;
	Wed, 25 Mar 2015 09:46:57 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.42.190.69 with HTTP; Wed, 25 Mar 2015 09:46:57 -0700 (PDT)
Date: Wed, 25 Mar 2015 12:46:57 -0400
X-Google-Sender-Auth: bIIrqwADpzqBIBoZ4wB6lFM9ZJ8
Message-ID: <CAPuovEK8Ta1x-OOR4mBA0G4_r7P_LJOx93p86HhMF5JCg-+rnQ@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
To: Lai Eddy <eddy.lai.tw@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: ERROR: Layer 'networking-layer' depends on layer 'meta-python'
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
X-List-Received-Date: Wed, 25 Mar 2015 16:47:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 9:44 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
> trying to build $ bitbake kvm-image-minimal with Ubuntu 13.10 host, poky
> 1.7.1
> and following README inside meta-virtualization to setup me-virtualization,
> oe-core, meta-oe dependencys,
>
> got following error messge:
> $ bitbake kvm-image-minimal
> ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this
> layer is not enabled in your configuration

This reminded me that I had a patch queued to send to update the
README. Sent now.

Regards,
Mark

>
>
> should meta-oe/meta-python added other than meta-oe, meta-networking and
> meta-filesystems as README said?
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

