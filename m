Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E7CBE00C01; Sun, 12 Nov 2017 17:23:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F646E00AF9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Nov 2017 17:23:26 -0800 (PST)
Received: by mail-qt0-f195.google.com with SMTP id 8so17826269qtv.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Nov 2017 17:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FutP1epm+QjrvRJIgObYkhp6HOqq6B2qVwuUCFqEBmA=;
	b=js3AXh56jxPvGfRROGO9HRRDgxGs0cCn+pADrSWlS7ndS5Nq6N7xSTXJMToKezQmui
	/+jJb/jiEmYCtXk/2fsXF+yxhk5cHfPf3aOJ0fkdoX7AxhlDC/DZlwWPkEo14cnkkaGA
	JPnWuUO46AzQP0FSf3vPipuWOrlp2hkjoI7RQplv5VucxKWh2XdL4a0gmS/wWNLGjz2o
	ttqiwqYljZFJDBFVKtZRp7mJK+pOG9/pA5U/TpQxUoZQ5LmXVeY8QsYO7JKhaaoU7WRH
	QXrUap7fiYF1PkvkWDAy1oMnm2mbd4H0ZI8Os0n/w1AvyJM6EtT43JAj2Jg+JPf4WOTR
	yBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FutP1epm+QjrvRJIgObYkhp6HOqq6B2qVwuUCFqEBmA=;
	b=OBuhGGHGnvUXSo6Y4ix1o3UR+PGFOGGNyWVRnyXg0rgXIf6MqLjI57SsmL7AYnLDtm
	9CZWDN4Aer6sBPhj9fyUJQAoE0l2CdHsBIlFq+EL9Mn2KUP80594kopqgoPqwCQ0J/gF
	ArMyX7zedn+pIvRq0iVd0diMmAvTyNkqbjQKF4yvAjmGWIw2ptTZszPCSVd3CP6CnLVa
	CyyFnUFSwsOPqBFPK+c/Z25Y19dmFL+gNqCeUF4XehvpCgsOgYi7iOyt0ZFxdwg3r236
	HvA55E8gm5NLoeqyD74uVaaJxo4kn8fWuAV8yml0sQIHIyaSD8oKWqMnVu0IYsTJ1WBo
	9z1Q==
X-Gm-Message-State: AJaThX4weo1Nf21PYm3ofOt/xni5DUPxEIAiGJnPGRn19oHrUMIEr5ei
	yE/JbnDf705ZJDkhqkg6VQ2GKPESSN9jXhzX0WU=
X-Google-Smtp-Source: AGs4zMYzlCS/fVzw/mViyrnikwfwNzgy1CKF38jJMdrSmVxS13HUUdqnOAsKP/9OeyfLHHytudWLSuYTmlnZ3ze5Gis=
X-Received: by 10.200.19.11 with SMTP id e11mr11917466qtj.68.1510536205888;
	Sun, 12 Nov 2017 17:23:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Sun, 12 Nov 2017 17:23:25 -0800 (PST)
In-Reply-To: <CAGQ4JX2jzoZZPeJ0aWvf+Z3hU5Qh8gWJs2DxQ-0ZoN=oAxk24g@mail.gmail.com>
References: <CAGQ4JX0waag2sfdSmPSvFe609-V6s2HTEYgrG=Qz9OSio1SWMA@mail.gmail.com>
	<CADkTA4NXiDWTsmQHO+WtO4qxGCe4st4368=O54ApDF4J-QgTXQ@mail.gmail.com>
	<CAGQ4JX2jzoZZPeJ0aWvf+Z3hU5Qh8gWJs2DxQ-0ZoN=oAxk24g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 12 Nov 2017 20:23:25 -0500
Message-ID: <CADkTA4OvvidGf6_eS-vBkpr3n+sEdYySGfHGXYDr8Y6Py+1WHQ@mail.gmail.com>
To: Ravi chandra reddy <vlsireddy@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Issue in irqbalance Code AARCH64-ARM-A53
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
X-List-Received-Date: Mon, 13 Nov 2017 01:23:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 11, 2017 at 11:03 PM, Ravi chandra reddy
<vlsireddy@gmail.com> wrote:
> Hi Bruce,
>               1. I downloaded 1.2.0 version and i tried to build on AARCH64
> compiler and i see compilation failure.
>               2. issue is fixed on Jan 15 and file is compressed and put as
> release on Jan 10. In other words, release 1.2.0 does NOT compile with
> AARCH64 same way as 1.1.0. [unless someone goes and fix in
>
> vi
> tmp/work/aarch64-xilinx-linux/irqbalance/1.2.0-r0/irqbalance-1.2.0/procinterrupts.c
>
>               3. I have written to Author of new release package. I will
> await his response and post patch.
>               4. Let me know of other alternatives.

upgrade to 1.2.0 and create a patch that fixes the compilation issues,
submit that
uprev + patch to the list.

Bruce

>
> Thanks
> RC Reddy
>
> On Fri, Nov 10, 2017 at 10:48 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Fri, Nov 10, 2017 at 9:43 PM, Ravi chandra reddy <vlsireddy@gmail.com>
>> wrote:
>> > Hi All,
>> >
>> > 1. based on this link
>> >
>> >
>> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-virtualization/
>> >
>> > 2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]
>> >
>> > 3. Building meta-virtualization library for irqbalance failed for
>> > AARHC64.
>> >
>> > 4. The Issue is simple bug [i fixed in my downloaded, untar'ed
>> > code],looks
>> > someone also fixed the code and new version 1.2.0 does include this fix.
>> >
>> >
>> > [https://github.com/Irqbalance/irqbalance/commit/1dccd034a90b2f0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c26a4604e551]
>> >
>> > 5. Is there any reason why irqbalance is NOT updated to 1.2.0 in
>> > meta-virtualization.
>>
>> Nope, no reason.
>>
>> Send a patch to upgrade it, and it'll be 1.2.0 :D
>>
>> Bruce
>>
>> >
>> > 6. According to github, version 1.2.0 has Aarch64 support
>> > [https://github.com/Irqbalance/irqbalance/releases]
>> >
>> > Thanks
>> > RC Reddy
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
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

