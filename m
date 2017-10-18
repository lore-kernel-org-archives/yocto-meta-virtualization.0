Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C86E2E00D1B; Wed, 18 Oct 2017 05:23:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.173 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A29E9E00CEC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Oct 2017 05:23:34 -0700 (PDT)
Received: by mail-qk0-f173.google.com with SMTP id o187so5928852qke.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Oct 2017 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wJ01RVKroFZY9RjJyi7dpPCs83puG3Prdumo/DJSm4E=;
	b=YHZjdbEYcl7TXKinDdukOc8EONE+M0dA5iNHcbIraTu5H2W9Oi/3tGmvmHebZQf9Z3
	AFZrtGTVl2La8WO70sP06X5gOJNNm29iYyfX0Qshjbng6JghIAtQuQsbZ1h0oaVRvE3P
	JGzWy6aBudk2qlIliKdOfTjiJFhhm7WE5e0ou86+7FlyB/t9qpsvjeMcPHdbgNr80WGs
	pRwkE7qV3/0Snces776hQyzdjeQV3pmgzjDkPQ16Dx8hvfTuONS2TZFWzXb4xZhu1Dum
	pD4Iv4en0AyHxgw8eDRyWmtN4COqzRtakdoU8L7vR0vSrqNbn0jL2d+rnqEA3VmTX2Rr
	K5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wJ01RVKroFZY9RjJyi7dpPCs83puG3Prdumo/DJSm4E=;
	b=kf8XN7ewK/uiPU44pGDY/ftPvssOpF+sm8SBRMJUkmgF9132CfIpjMjC+Fvrl8CtJi
	R88y9gL7sMpYUwiZ6MfR7I+VrSrPo0AKUKvC85EULYYGgyeolkNROsuDMAkE5vDeHRxo
	3rw58fzU0VFtvtbuvhzznmhBINt8jzcmg4u8DBKjL8dE4htPV2hexHZxvTOyYyBxC3ra
	/wFtV8bVK8aJ0D8FiP+wKn88sSdL/7M741ZfEGywnHQtB+ja68GiTVfuOMthZvQHIw9X
	nxebYwdQcPRyIllm89kX0Zy3KA5gY7FmwxDmiE+3ptZWoIUyRmMC0NgTPf34LYnkhKxt
	So3Q==
X-Gm-Message-State: AMCzsaUDyrSmWmGOMe1dMtQzxTYbMgiDJIA/183vzzob4yPjgW/qVMlT
	jcKr97gN7f8ajwdIrgqTXEE2V20bI/u2ZiQWaWQ=
X-Google-Smtp-Source: ABhQp+RNOIFRqRxP5eVwOVjsbgFy74xBFx8gl5vGVf6mMJoYAS7DzxwMrTx3ub+H828hh8bfpKFCHp3NJMwJG3beaYM=
X-Received: by 10.55.70.67 with SMTP id t64mr1963300qka.103.1508329413693;
	Wed, 18 Oct 2017 05:23:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 18 Oct 2017 05:23:32 -0700 (PDT)
In-Reply-To: <CAJ73Ay6Bi=gd1i=yLi57QHVh0Coq+__O7VPtL-oSerzp9Dd=bw@mail.gmail.com>
References: <1508256804-4341-1-git-send-email-dariusz.pelowski@gmail.com>
	<CADkTA4NPWR1Yjnt-2mx=FxRRBj3O5U71tETOtATPiqH4VP8RNw@mail.gmail.com>
	<CAJ73Ay6Bi=gd1i=yLi57QHVh0Coq+__O7VPtL-oSerzp9Dd=bw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Oct 2017 08:23:32 -0400
Message-ID: <CADkTA4OK6iVbakeNM_17Fw20wG_am-YQPLQ3yBho0nFAAF3GCw@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] vgabios: don't override the compiler ldflags
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
X-List-Received-Date: Wed, 18 Oct 2017 12:23:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 2:17 PM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> Hi,
>
> When building biossums on genericx86-64 machine, I'm getting QA issue:
> ERROR: biossums-0.7a-r0 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary:
> '/home/darekp/yocto_builds/tmp/work/core2-64-poky-linux/biossums/0.7a-r0/packages-split/biossums/usr/bin/biossums'
> [ldflags]
> ERROR: biossums-0.7a-r0 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
> ERROR: biossums-0.7a-r0 do_package_qa: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /home/darekp/yocto_builds/tmp/work/core2-64-poky-linux/biossums/0.7a-r0/temp/log.do_package_qa.19574
> ERROR: Task
> (/home/darekp/yocto_builds/meta-virtualization/recipes-extended/vgabios/biossums_0.7a.bb:do_package_qa)
> failed with exit code '1'
>
> It's caused by overriding LDFLAGS variable to empty value in project's
> makefile. In consequence there's missing LDFLAGS settings from bitbake
> (including -Wl,--hash-style=gnu, which causes showing this QA).
>
> This patch takes into the use LDFLAGS provided by bitbake.
>
> Is it okay for you? What do you think about replacing sed invocations with
> patch?

With that explanation in the long log of the patch, it is definitely ok with me.

Cheers,

Bruce

>
> Dariusz
>
>
> 2017-10-17 19:12 GMT+02:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>
>> This needs a long log.
>>
>> What issue are you fixing ? What arches is that issue showing up on, etc.
>>
>> Bruce
>>
>> On Tue, Oct 17, 2017 at 12:13 PM, Dariusz Pelowski
>> <dariusz.pelowski@gmail.com> wrote:
>> > ---
>> >  recipes-extended/vgabios/biossums_0.7a.bb | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/recipes-extended/vgabios/biossums_0.7a.bb
>> > b/recipes-extended/vgabios/biossums_0.7a.bb
>> > index 10bd014..e66bade 100644
>> > --- a/recipes-extended/vgabios/biossums_0.7a.bb
>> > +++ b/recipes-extended/vgabios/biossums_0.7a.bb
>> > @@ -20,6 +20,7 @@ do_configure() {
>> >      # Don't override the compiler or its flags:
>> >      sed 's,^CC,DISABLED_CC,' -i Makefile
>> >      sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
>> > +    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
>> >      # Supply the C flags to the compiler:
>> >      sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
>> >  }
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

