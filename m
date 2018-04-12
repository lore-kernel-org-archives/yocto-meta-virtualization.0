Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E5B7E00B66; Thu, 12 Apr 2018 13:02:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76CE8E00873
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 13:02:24 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id m200-v6so9460636lfm.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 13:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+EfUv0x1WYSE3VOi6AVr7j327TslpLTwFcU2OKzlnKY=;
	b=OxEVrmFzy9rHyqc1fhN2cKEdVEafpFX5CeCJEN1TBwKnyWmWvkhmJeTF1CitdBsmkB
	Jg1sfakX3sqf/dqgkroIPugdO+ie7PZC5ixCNjpyQ4duo4yrBrlWROAXlgOgO2myQLvi
	oVNPrXryxlNfP8Iv4oj2+nXX1gCJ7fis+YkCIZ67knw4gLXbOqF7Kww8Lqj45M2E+r7/
	yQb6XP5ZqvS/Jz1o/u8AGS03j/+AhR4/gVbeuJHP24cGoy65g5bMRiI0YSssFQCNMxE4
	xUllayT/0mvL1SfljofgF82ljFMcRkBdfoFsha08G+bxZCkL3z5SHz5pWu2vPWg6W8ks
	Spow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+EfUv0x1WYSE3VOi6AVr7j327TslpLTwFcU2OKzlnKY=;
	b=XG5i+9zKpp5hRdFACOA7J5V4Cj6vLwwX/Qj5j5ZrGjiR9kFyd4SJLWFsKQ8P02/t6i
	WaoO38kfAOf3QL8cCsj9FF2zq6QB0Vez/lX55gN/bv3kXXLLIpkalvL+4TIAgUaJJ7kA
	GDFFSLbKgudloqeVhC4Vl42AB9O3fQyaVFY9rvryHu2YMKXdyx4zuzp0JySokM3dd12q
	4nauE27ROaihx5xzAJ/KeLrgbEYoZKiOdhLIc6JLwLkzLXcUeJIaETEo3kwzwDQHtEf2
	jW/X4YPZg/Ew9LAJUrSh8HTgFcxQ0J6zI7AiqwWX87QPMK8RUL/ztUOgLBAWxUQU+F0o
	mMrA==
X-Gm-Message-State: ALQs6tA4gfWAC2cbE+/6spFDwKeksaJHuk/lBzQI+NMUB2HgOuGV8KQQ
	W0gpzSIJ7e2gIxAGg3sJ/tB2pNlNjoVpLasTk/0=
X-Google-Smtp-Source: AIpwx49GXc7D7SfRAKOl2eOEYCFbSApPdYeU2m0zhONEdNEYE+k1Jf+BBCdeCQtq1yKxD57MxbzQJlaC6yNSB359B3A=
X-Received: by 10.46.134.25 with SMTP id a25mr1497504lji.87.1523563343128;
	Thu, 12 Apr 2018 13:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 12 Apr 2018 13:02:22 -0700 (PDT)
In-Reply-To: <CAAPZna0qO06oe4s_JWXJ1YxGrZvJrWukuiu-tt1=ny6s6vZWHw@mail.gmail.com>
References: <20180322032718.353177-1-yunguo.wei@windriver.com>
	<CADkTA4N48OksSNJrEYhdOf-34ForTLMUPes3QCyHQBkG2t8TUg@mail.gmail.com>
	<CAAPZna0qO06oe4s_JWXJ1YxGrZvJrWukuiu-tt1=ny6s6vZWHw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Apr 2018 16:02:22 -0400
Message-ID: <CADkTA4P4rCFBg1=wkvRWK-nFtBapNqSP49cupmb9nAo1yF06HQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] go-fsnotify: switch to new repository on github
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
X-List-Received-Date: Thu, 12 Apr 2018 20:02:25 -0000
Content-Type: text/plain; charset="UTF-8"

no problem.

krogoth now has the change.

Bruce

On Thu, Apr 12, 2018 at 10:53 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Hi!
>
> Can this be backported to krogoth?
>
> On Thu, Mar 22, 2018 at 2:02 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> merged.
>>
>> Bruce
>>
>> On Wed, Mar 21, 2018 at 11:27 PM, Yunguo Wei <yunguo.wei@windriver.com>
>> wrote:
>> > fsnotify is changed to new repository on gihub, so adapt this chanage
>> > accordingly to avoid fetch failure.
>> >
>> > Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>> > ---
>> >  recipes-devtools/go/go-fsnotify_git.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-devtools/go/go-fsnotify_git.bb
>> > b/recipes-devtools/go/go-fsnotify_git.bb
>> > index e5bcf14..1d9fbdc 100644
>> > --- a/recipes-devtools/go/go-fsnotify_git.bb
>> > +++ b/recipes-devtools/go/go-fsnotify_git.bb
>> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
>> > "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
>> >
>> >  SRCNAME = "fsnotify"
>> >
>> > -PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
>> > +PKG_NAME = "github.com/fsnotify/${SRCNAME}"
>> >  SRC_URI = "git://${PKG_NAME}.git"
>> >
>> >  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
>> > --
>> > 2.11.0
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
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

