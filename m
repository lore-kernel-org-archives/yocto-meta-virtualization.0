Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B57FE00E39; Wed, 14 Mar 2018 06:07:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 310BDE00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 06:07:46 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id h127-v6so4652385lfg.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hPl0jwTbVKVoUfzo3Ga/e7Teavox4f+wZFFTr6pcbsA=;
	b=oL5SYZ3pC7hbwBlUk/7SkDU1ba9lpvf33XqEUaPAnH1l1aMkLmc5myQXyHfz87jj34
	QzCW6/WNwk8scm11adugXDzywzTRTnmkFk9KcIl4v9o4On/qSzysVZPLtyqzWCS5+6eM
	R5JJhiSSz9lFlU6CcKdjFETmZaMxY/haXVfr5Q6ePv4e5MSDMgNDgZid135ui32ZR8+E
	SX9PeqdTMtOo8x9NaY47R7At/7BdNDwY9JGfHmAI9uoTSu0DgcVE2m8uC/fd9FM8V3a1
	i1AsIf2+bwuDlEBHPB24q+ecsemHEwNb9YWzd4bdBm7YqfJMOHx0H0vwtTMJJ3Psv6AG
	D/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hPl0jwTbVKVoUfzo3Ga/e7Teavox4f+wZFFTr6pcbsA=;
	b=du3k5NxjzWHR+++kMDLmo2AcbVPBvMa1ijZfpjcj+0F07SGH10yOqDmKqkdqR3y1zu
	oj6tC7ctkBDUHSDDZFZU/mou3DoItelExaStX2AwE3T2Ma/iIk4dBpzvX1VRKlU0V9YB
	+EastcEUZgvZf4DFSq/pugPZbAevxbSmcTVqts+8IJzn6012K4hnd7PgzseCqjnkUtAY
	jG3dmU87vVOYowoMKOTr3O1n/AKE8OEZEOLFtQJg5TqjDP347lq/mLX0dVeGhxQbQUze
	0BCVByc26fVNdUHulbwuxBkzpW31K1avvOdvUYRC8Hu98NFEwqj5cHyegCpWOmMILLEf
	W3Tw==
X-Gm-Message-State: AElRT7FOmwvVkJcsdTcxVJ465LNZ4RF+UVTPHWugwEFi/n1zUTSI0uFi
	vb5UN3/9HbzEyerU9zcMF20brQKcM+oiUSPSioqIqQ==
X-Google-Smtp-Source: AG47ELvUtHXldJrOIXgcLyA3VIpY1UTlkU4TEHPSdAQl5GIzBm6WK+DIQ5qKLvDJX8oimGmmstX+t/e3uWHPEm58IoU=
X-Received: by 10.46.86.1 with SMTP id k1mr3227009ljb.28.1521032865481; Wed,
	14 Mar 2018 06:07:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 06:07:44 -0700 (PDT)
In-Reply-To: <355BE46A91031048906B695426A8D8E61735E9A1@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314083947.22458-1-pascal.bach@siemens.com>
	<CADkTA4O1ze=NKO61dL_C-h99G5Bx49gXrEVrHXDz4+Z6nP7h2w@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E61735E9A1@DEFTHW99EH4MSX.ww902.siemens.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 09:07:44 -0400
Message-ID: <CADkTA4MBqwhW_Pe+v_5dgja+osuTkbd_wjdOvs8ZQ23bs9fxhQ@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containerd: remove redundant systemd detection
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
X-List-Received-Date: Wed, 14 Mar 2018 13:07:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 14, 2018 at 8:46 AM, Bach, Pascal <pascal.bach@siemens.com> wrote:
>> On Wed, Mar 14, 2018 at 4:39 AM, Pascal Bach <pascal.bach@siemens.com>
>> wrote:
>> > The variables only take effect if systemd is enabled so the check can be
>> removed.
>> >
>>
>> Same comment.
>>
>> This layer, and many others, have always had this check since that's how the
>> systemd classes worked before.
>>
>> Can you log the oe-core commit that changes the behaviour in the long log of
>> the two cleanup patches ?
>
>  I cannot point you to a specific commit in oe-core. But I also don't see anything like this anywhere else.
> All recipes in oe-core I had a look at just set these variables, no checks.
>
> So you make any observations that makes the check necessary in this layer but not in oe-core?

Throughout the various systemd integrations, we've had services that
didn't start/install when they should, we've had services that would start
when the shouldn't, and all sorts of other combinations.

Plus historically we supported both systemd and sysvinit, so both the
packaging and install rules needed to be conditional on the init system.

In those same recipes, the .service files aren't being installed if systemd
isn't enabled.

Although I haven't tested it lately, IIRC, that lack of .service file + the
packaging being enabled triggers a warning or error.

I'm actually fine in walking away from sysvinit support, but I know there are
still some users of it, so I should first document it as depreciated, throw a
warning and then remove it completely in the next release (i.e. not just these
cleanups, but remove all the systemd init system checks).

Bruce

>
> Pascal
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

