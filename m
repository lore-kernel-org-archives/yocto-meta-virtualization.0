Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF993E00460; Wed, 22 Aug 2018 08:44:06 -0700 (PDT)
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
	*      [209.85.208.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77339E003C1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Aug 2018 08:44:05 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id u7-v6so1809945lji.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Aug 2018 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZAzu5Ou2TYARHpLr5bRQUVFRKhZ0ZfxPqdbY2pMF7a4=;
	b=HzQDqrTDHU1RrDPe3UwRKvh5lCvencZTOvrvPSBXVHRYZUHVdaZ/LS3ADSTOz70eDC
	IOJbiyGGZdE30tNPz5RDmgoK+GZe7eFm9VKLEomjuSdmyzIvixDymg5u5UOsLvqUFd0o
	jVCX9/D8qYwp6Aij336jLz8qXwG538DIHqTou7awJkqcjW4xWzgnWAl62LQh83QePVCn
	QY2B+sgROuVOtRosiTWQ5KZuny2GTPB6Jf4OE1qEwxUx9Bl6ZWO9aRy7R2I/hqSL9Afq
	zuc4tDn6Uh/iuosHSTKqaojjQyhNNn3R7CHdVcOSe28vmAQWO0UBdfLUQLASmiz7227Y
	LlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZAzu5Ou2TYARHpLr5bRQUVFRKhZ0ZfxPqdbY2pMF7a4=;
	b=oq1PvOfnoXM2m8hgsXDDEGPlFcLy6AHyZanxohMywhZOCXuxztv6lXYXeovR0HoSfO
	/qgKsI75Sehq9wm2F2KXSJVaN3o7wDHZmofUZ+5U3vX4GSEbkZGwz5spqNkDbQBZ+OW8
	JY3kQusn5a5h77/OxsQvt6A9KGfXPNIe0Cn8KAv5Ej4teQWrF74rPIChmEU5z/vL7fSH
	WYF7SCCJohf+BlFnuK0/f07tx1AvWxEFISIg+/rBsL3kMM+F1jXYwbWF9D04ZPklYTwW
	0vCx0+G3j9CnG22Lc50p0hqbWUxpd3O4YQZRj85tqOkktGj15EiLCyqD9CFlEmPd+rrF
	Bi1A==
X-Gm-Message-State: AOUpUlG+TIMONqx43pa3EFgTCihCzUPIeEXa5AAsVzTZJnHCEaaVeQxW
	9r69Q0T5d4SVu+i7nY1qRF8tQVIP+zlqtMQuVws=
X-Google-Smtp-Source: AA+uWPxq6eMXaDCSD31HP6uWFeEHShGQDeY6oAlvhGuLkohOg9QxiTkvAHUUHlcKt0pKXakWYShJSEyRso96dxYYe4Q=
X-Received: by 2002:a2e:8:: with SMTP id 8-v6mr37476242lja.112.1534952644414; 
	Wed, 22 Aug 2018 08:44:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 08:44:03
	-0700 (PDT)
In-Reply-To: <CAG3Cyz8_qsDW=53JVBNBVUrOMbhYk4Ou8P1P2qD8pBbizPNLLQ@mail.gmail.com>
References: <CAG3Cyz8_qsDW=53JVBNBVUrOMbhYk4Ou8P1P2qD8pBbizPNLLQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Aug 2018 11:44:03 -0400
Message-ID: <CADkTA4NjRAdfEyxFp5ZiRXKgpqEpfD6Os_ujeO2qsoPqsE+GEw@mail.gmail.com>
To: Sarayu Sivanandam <sarayu@m5nv.com>,
	Massimiliano Malisan <max.malisan.uk@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: LXD on yocto
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
X-List-Received-Date: Wed, 22 Aug 2018 15:44:06 -0000
Content-Type: text/plain; charset="UTF-8"

Max was posting about doing LXD work in april of last year. I've added him here.

Bruce

On Wed, Aug 22, 2018 at 11:29 AM, Sarayu Sivanandam <sarayu@m5nv.com> wrote:
> Hi all ,
>
> Is anyone currently working on a recipe for LXD .
>
> I am looking to create a LXD recipe and i am new to yocto so any inputs on
> the same will be very helpful.
>
> Thanks and Regards
> Sarayu
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

