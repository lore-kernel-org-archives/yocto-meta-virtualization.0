Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC2C3E007DA; Fri, 16 Mar 2018 06:39:49 -0700 (PDT)
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
	*      [209.85.215.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FD24E00752
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Mar 2018 06:39:48 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id l191-v6so15447673lfe.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Mar 2018 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pNdmmlVE5IDpoJBXzrjzMfGrVZD2dO9dTrY1UFLWI1E=;
	b=dEN9fsPgerIes8/CFyyZDYkP5QkK0pujJlYiRfv4bZKwMW0tGZH/Vo49jny7en1mQ+
	GY807Gc+eLOBhu4m7xbMJbNNp0KOt6a3cn+3r3XuLPB3iD0YfIlahB1QZ3vt7dqjFkcF
	+W2zyEpWO2xo+u0RLjsjUjHHrvAPYXffRs75C+XECZ+HsEogo8qKUfvjf5jTDUPd2zpH
	XNncFd37Njkaf3M3x8ClOnPscBlzdwqo/J8sc+Xe6XKBqXwvcE+IKPHzoSCry8dCpZUy
	xDH6xQMXTwaZRpL1HaG3vbtxh6YvEDKgf86i82HzxVwl8JO7pX3eNqlsWCr1ZUrJZrZF
	uFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pNdmmlVE5IDpoJBXzrjzMfGrVZD2dO9dTrY1UFLWI1E=;
	b=SOo2uSlhbSe8JUWuux+oXpCWkiKnTfzvDm10dudoZjrZH3x8Cfwh9BgRZUF7lXvjjl
	dqQQxL28zzRavAaVZ7ZfPM43wQqluvWX+2+kPk8gkiODQIxBmU+b5EujkxPbBYHgCcFw
	Z4EORUUttUHDvqBM3+hTO2NaQfReochnrCsc+Y/64YNsGlid7fdWkGXVAw06dcxS1O9S
	ai+ZTxCkmkc9esIYRRgi+Abl3DB0el9g/GGgtHel4AdhEu4Q62TNA/4sAH0zaBwhdZo1
	ywMsLFQgkj3r+m6uyfulrD/SrjlNmmbZjTY/jUZlQhjkILympMD6MvYiPOMYpTBtksEz
	loxg==
X-Gm-Message-State: AElRT7FbJxhmEjhx9PuOsNAUW1tkn7r0EKRWINZAYdf7fU2NLYtxkZJ3
	b89ew4GICrNtIJ5jleLrZK9TKo+nSj+QQOwXl+c=
X-Google-Smtp-Source: AG47ELt4VAjsQUIpk3a0A7yO6iCFi8UAdpQkmW1snuyTTywcLwqhsN9b6AyrUhYrJ1uwf7yyx2vqq/1bshqm+KScipI=
X-Received: by 2002:a19:5789:: with SMTP id
	l131-v6mr1462220lfb.135.1521207587542; 
	Fri, 16 Mar 2018 06:39:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 16 Mar 2018 06:39:47 -0700 (PDT)
In-Reply-To: <355BE46A91031048906B695426A8D8E61736147C@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314084005.23014-1-pascal.bach@siemens.com>
	<CADkTA4Mom5R6DXGgH8i0xEEfY7bgSWtZ=6==q9T7an8QwC+wdg@mail.gmail.com>
	<CADkTA4O8eie3g1HE-T2DEZt8S=w0dPMLc-iDFiEkxU0=UJ_j8A@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E61736147C@DEFTHW99EH4MSX.ww902.siemens.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Mar 2018 09:39:47 -0400
Message-ID: <CADkTA4OEhf9vCCb+4+Pdu8QeuFNu7Adgv6y59g4pYq_V8-hwxg@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] style: make indention consistent
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
X-List-Received-Date: Fri, 16 Mar 2018 13:39:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2018 at 5:30 AM, Bach, Pascal <pascal.bach@siemens.com> wro=
te:
> Hi Bruce
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Mittwoch, 14. M=C3=A4rz 2018 13:42
>> To: Bach, Pascal (BT CPS R&D ZG FW CCP) <pascal.bach@siemens.com>
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH] style: make indention consist=
ent
>>
>> On Wed, Mar 14, 2018 at 8:36 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > urk. Thanks, but no thanks. On the next package update, I'll take care
>> > of these, but I avoid all whitespace / cleanup patches like the plague=
.
>>
> Fair enough.
>
>> And I should have added, that I have a set of updates almost ready to go=
, so
>> I'll stack some cleanup on top of those changes.
>
> Can you elaborate what updates you are working on?
> Bacause I'm also looking into doing some updates around docker and docker=
-compose. So not to duplicate work.
>

I have the full set of docker/moby/containerd/runc packages uprev'd
and going through
system test. These packages love to introduce regressions and I've
already fixed a
few runtime issues, with a few more to go yet.

Bruce

> Pascal
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

