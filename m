Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77CDFE004D2; Mon, 27 Feb 2017 15:03:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.67 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB591E003C1;
	Mon, 27 Feb 2017 15:03:56 -0800 (PST)
Received: by mail-oi0-f67.google.com with SMTP id f192so1648704oic.3;
	Mon, 27 Feb 2017 15:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GZgCkfJMj9nhssFjUnPzv55X2W6UOx6m8RbFmj+7Mwg=;
	b=KhW4hTHzXeEO1WzlwAHOObzzkhL2nhCsu2y0pArRLSDEvkAtnm06WrtwcDZDzfWaRs
	+hpAwmFq4XPQyJTI21oychAUjR6RYvRxrLExnKNwrIbgfzJOCR2lPLkMYS9fhpeF7pTc
	fG3pxUjyuV+x+AUczQTtcNmUP8ECvxz4UT4U+zhVIzOvCtZUJOxmoJ59Mb4YhJhbn1Kh
	pa/ZKN/W8XH6wRmUizyr7602iUuq98XmZjwE7lOddCIw/ADMznuzV2K7zllqrkXowoVL
	3acxFsj6Y5SAEy5ddZSL38ni8TcR14t5fPULP02k6oOR+thxtR89g0XPaAPrI7H0nI0P
	khZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GZgCkfJMj9nhssFjUnPzv55X2W6UOx6m8RbFmj+7Mwg=;
	b=IJ+VWyu7R/tpzVYHGVKgnsSHLMtnYPR7JDgCJbAO6/jy5sYh9jYmj2AN/C32O3f3k6
	FcKKMcK+KzWc8v+cSbvosiQqzGLBmAn6Bj0aX0xwMqjEaDkGisn4Rm8r9lU/7o8x6Isb
	EpQYglpjhshPWSAXWY8bolnCpmPdUMnB6Y4/apHTFeSJDrYlmlB+jId5+kZFa/UHZdQx
	JWOIG7zSbZVaOoNeOMBFia6nOymEE8+MSSGvckQT2OMulRcwUQPLxANo9QFy5p559+qA
	woZstHmkJFnHPIz8fIyqdqZ5H34NmqkAI0OxQNvbJ7vx5G4Epz0V6mrrpkNerxZfMLCE
	4b5A==
X-Gm-Message-State: AMke39louFVpBNBJv9LsSYw2TlMRB2KAcEMrlrrakU1kPDll3vKudTcqT6xtK7Tois270EiEnH9sZffcvPaYFA==
X-Received: by 10.202.226.19 with SMTP id z19mr8885234oig.166.1488236635725;
	Mon, 27 Feb 2017 15:03:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.44.231 with HTTP; Mon, 27 Feb 2017 15:03:25 -0800 (PST)
In-Reply-To: <CADkTA4PNN_s5==0=d+64sWY377UQcF5JWjuFOxNaPx3sfzerBw@mail.gmail.com>
References: <CAFL6qn7dufbc3dgfDywS0FNFP7DzCicuXJtGnDJDXMy1YVcX8g@mail.gmail.com>
	<CADkTA4PNN_s5==0=d+64sWY377UQcF5JWjuFOxNaPx3sfzerBw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Feb 2017 09:03:25 +1000
Message-ID: <CAKmqyKOAF2kjp7-My_V1uJJXmTtqN8crbHzEJGu6jeCZo=OjhQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	"meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>
Subject: Re: [meta-xilinx] Using Xen hypervisor and Docker on MPSoC QEMU
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
X-List-Received-Date: Mon, 27 Feb 2017 23:03:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2017 at 11:32 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Mon, Feb 27, 2017 at 5:51 AM, Pello Heriz
> <pello.heriz@alumni.mondragon.edu> wrote:
>>
>> Hi,
>>
>> I'm interested on building an image for ZCU102 board using Yocto Project
>> for then test the image on QEMU emulator. However, I need to know if is =
it
>> possible to add docker and xen hypervisor functionalities to the created
>> image just adding the meta-virtualization layer in the bblayers.conf fil=
e.

Xilinx's fork of QEMU supports running Xen ontop of it, while mainline
QEMU does not.

>>
>> I have never experimented with Docker and Xen, so I don=C2=B4t know if a=
dding
>> this layer would be enough or what I need to do exactly.
>
>
> There are some other layers that needed to be added. The list of
> dependencies can be found in the README at the top level of meta-virt.

Once you have added meta-virt and the dependencies there are some
steps of getting it running here:
http://www.wiki.xilinx.com/Xen+Hypervisor+through+Yocto+Flow

Not sure about Docker, I have never tried that. Should be similar I guess.

Thanks,

Alistair

>
> Bruce
>
>>
>>
>> I would thank any reply,
>> Thanks,
>> Regards,
>> Pello
>>
>> --
>> _______________________________________________
>> meta-xilinx mailing list
>> meta-xilinx@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-xilinx
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

