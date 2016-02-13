Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4560BE00CA0; Fri, 12 Feb 2016 19:37:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (asselsm[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B372E00C9B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Feb 2016 19:37:32 -0800 (PST)
Received: by mail-wm0-f52.google.com with SMTP id g62so42760832wme.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Feb 2016 19:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=S16w00L1PEKclMiXtiAk7ZHRnnS8vPZKnG+aaY409g4=;
	b=Y4di34EaO4nfki4vo1V3BeCQ2xtytUM77QIL3vC9qSJm3qUkMyaEbZ+4ikzuWPN7BP
	ZmIeMe30LuH8jsRx1v2PbRX6zq7WtFP2JgkiO8FENlH7gGRysACsGOlKasIv1UHqYDuD
	Rmmmrb6z5nJMoJ4EBhtjyp2itlTrvoR3J3lizqqG6+j/mJBfKYiYc2X1CnmRTMuoihYL
	jN/fOsHM2ya/WRQMgJYv/dfnZFNmQCtL0GWKbjJkBaQhu/Z96hb8GlAPIne39m5e2q87
	KbAYvk4CSxplDnvCzCf9v81+P5JwemD4JkLAx0cxvmN6p4vdbk7q46Gna+YX/fbO5Fn4
	TmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=S16w00L1PEKclMiXtiAk7ZHRnnS8vPZKnG+aaY409g4=;
	b=OPda5vvbO1hcHubLZKQS69bSxtipGLMsazL6gN+2Re9CylBugvofIoQH2w0KAToNJr
	gTVZ8ZsYbFUWnbeDSte+9FU9kv/E5UZu5HRPi+soZ6OqDk2p9GQkOHXJcX8nndH8SI2B
	tG+JH9DsdZ1ZWxZpK4LJiQpAezsjKSdnZf1iemZvSCsuIHTV2ZooIYlguGIG+6i4x9jR
	p6kf8YqWHsAS+UNKUERhD6cjXmZNS1GGIhlgOSGnIQ1IBOkexLa4ASlCHiwqh8zUzbJ/
	8YJBvRPluEEwjuJifzQchajCuunfRMxL4scYbe/KMq7KkiVodlQ8Gt9+yNlsyXpsMsSS
	D06g==
X-Gm-Message-State: AG10YOR2THzUT7W5Oux3Okhrruj0ULutzmdKXqVdkWEiQUDF+xAc2/C8Y5GyQNN8Iip0K5YsM9t2RP6tBgMg1g==
MIME-Version: 1.0
X-Received: by 10.28.156.199 with SMTP id f190mr1024346wme.83.1455334651986;
	Fri, 12 Feb 2016 19:37:31 -0800 (PST)
Received: by 10.194.203.130 with HTTP; Fri, 12 Feb 2016 19:37:31 -0800 (PST)
In-Reply-To: <CAO1oV+fmmzZ4XdV2BkgqH+Xoy-jdMRZ1msEfGaAOe-jOtQEjPg@mail.gmail.com>
References: <CAO1oV+fmmzZ4XdV2BkgqH+Xoy-jdMRZ1msEfGaAOe-jOtQEjPg@mail.gmail.com>
Date: Fri, 12 Feb 2016 22:37:31 -0500
Message-ID: <CAPuovEL=ugK+1VpVcNk3go=rQssAsowVqt_bOXBfc5b6MRt5sQ@mail.gmail.com>
From: Mark Asselstine <asselsm@gmail.com>
To: Supriti Singh <supritisingh08@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Getting virtualization running on mbmax yocto
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
X-List-Received-Date: Sat, 13 Feb 2016 03:37:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 4:22 AM, Supriti Singh <supritisingh08@gmail.com> wrote:
> Hello,
>
> I have a Minnowboard Max.
> I followed the instructions http://wiki.minnowboard.org/Yocto_Project from
> here to get a yocto kernel running on the board.

These instructions detail the use of the 'fido' release/branch.

>
> I want to enable virtualization with kvm.
>
> My source hierarchy is :
> $HOME/source/poky/"all the layers".
>
> To add the meta-virtualization layer, I added the following into the
> bblayers.conf
> BBLAYERS += "/local/source/poky/meta-openembedded/meta-networking"
> BBLAYERS += "/local/source/poky/meta-openembedded/meta-python"
> BBLAYERS += "/local/source/poky/meta-openembedded/meta-oe"
> BBLAYERS += "/local/source/poky/meta-openembedded/meta-filesystems"
> BBLAYERS += "/local/source/poky/meta-virtualization"
>
>
> When I do a build, I get the following errror:
> ERROR: ParseError at
> /local/source/poky/meta-virtualization/recipes-extended/images/cloud-image-controller.bb:29:
> Could not inherit file classes/image-vm.bbclass

This bbclass wasn't added until *after* fido was released.


>
> Is there something else that I need to do?

You can attempt to 'rewind' meta-virtualization to match what existed
when fido was
released. Try to reset meta-virtualization prior to
commit e50e36cfa3898b1defcbffe9f3fd0a20403c8de3

No guarantees this will work but worth a try.

Regards,
Mark


>
>
> Thanks,
> Supriti
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

