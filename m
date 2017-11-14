Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3867E00D07; Tue, 14 Nov 2017 09:33:33 -0800 (PST)
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
	*      [209.85.216.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34850E00C84
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:33:32 -0800 (PST)
Received: by mail-qt0-f176.google.com with SMTP id e19so22251955qte.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T1bax4e7z0SX7QShOGRo4tq1QDccXr2Q8W6qYgr12l4=;
	b=rJuQh6+yzeI2H8bZWPAh/ZjY3C+EbkT4Ofn/dD+gz8lpdBD4yC0NY1Ap2nYQxAt+KN
	mqnmS1eXZmtJww7itDqvEDBAleHRQ4xkpbefOyiQNstxUT4tZucTJqyeiC3365N1OGc8
	4lY3aFrIO4NhlgBlKeARY90tfoY0CoP9HTp7h7db5BXb66vFFHAdVyJMkctrAdqh9DKl
	/0QGUbGUmJozGK1LtyI46t/IZlmqGAymJ8CFiAWVroJ6bQSM2IGDWTCgl4sI7Gt4Xs+S
	lJ8XZ/4nUUxoQ2sL2+dO06s/n0N+3jBxV0thEH4PZvUGSyXwoC265vPW8xvUO1QH8W9J
	7Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T1bax4e7z0SX7QShOGRo4tq1QDccXr2Q8W6qYgr12l4=;
	b=oGM5q+Df2m1u6d1zFqX1R/mqE9q5RIE2f+gP25uNLEkR+7K8NLCTEXLyYL6utdJTX2
	WLcI2+otlfUMotDboN+RPUvIzuPOTD5otZbCgkmRg76ICmeibcdGgsrzuHnf6JZjWKXa
	EGSmYPBskjbi8ypsAr6rxSEE3bvbJnYVn9+YGB/eItz7oQ3xDKPzz//eso/1GhL9Bz8M
	BzKoCASl+P9ZO2gwFZEyCzzOhA95/Vfe10TCD5+oMkFRK3DHgTYYXZkOIDxyRuv9DPsZ
	33TCGcJIim1hxBJ+nBxFGn0xJ6vihnGhC469SewL9Dla86Racpvxx7pVTtG4sGSgAswk
	GemA==
X-Gm-Message-State: AJaThX4YlzDS7vteCTQkBxRI8CWk2OaSGbfnZcJDJplPO6L069/mOrRd
	lqQUUZ1nnq2fNKR8+pR6p9u80FKamQq2YhWorSZko+Yc
X-Google-Smtp-Source: AGs4zMaWZveMW8xXQ3BgRzMbudh4kRXeLs2GVVh08kYITLkZSdIp+9Yvlxqb03IDrF0cWWGJmS0Ldzz6zLJUM/qYp6A=
X-Received: by 10.55.121.2 with SMTP id u2mr19467358qkc.19.1510680812131; Tue,
	14 Nov 2017 09:33:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Tue, 14 Nov 2017 09:33:31 -0800 (PST)
In-Reply-To: <CAAPZna2fMCQ6qxZEKek=RdBsC7MdyxpiPOpMv4-y+OoDehvbAw@mail.gmail.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
	<CADkTA4MnT-KcNSZzhvpU_dQKV0rvKGApKJB6CgF7OnsZP0t=RQ@mail.gmail.com>
	<CAPuovE+=FS96vc_V4BHhXr6iq4c0jy5hJkEWZQBs=35rK=zfdg@mail.gmail.com>
	<3643043.t5deORmW9L@peggleto-mobl.ger.corp.intel.com>
	<CAAPZna2fMCQ6qxZEKek=RdBsC7MdyxpiPOpMv4-y+OoDehvbAw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Nov 2017 12:33:31 -0500
Message-ID: <CADkTA4OjsZ5cRyzDDUOhgx8oYx97XH9WdzHCxngb9mfVo_F2WQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Tue, 14 Nov 2017 17:33:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 12:14 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Hi,
>
> We have a customer using krogoth branch and is failing to fetch from pypi.
> And branches morty, pyro and rocko have http URLs for python recipes. This
> patch can be backported to older branches?

Does the pypi class take care of things in the old branches as well ?
If not, propose different patches for those branches, since as you'll
see in the thread:

"Bruce. Instead of merging this I will move any recipes that remain to
inherit pypi if that is alright with the two of you."

So that is the plan for master, not merging this patch as it sits.

Cheers,

Bruce

>
> Fabio
>
> On Mon, Nov 13, 2017 at 1:59 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>>
>> On Monday, 13 November 2017 2:28:34 PM NZDT Mark Asselstine wrote:
>> > On Sun, Nov 12, 2017 at 8:21 PM, Bruce Ashfield
>> > <bruce.ashfield@gmail.com> wrote:
>> > > First I've seen of this.  It was filed as spam by gmail.
>> > >
>> > > Was I actually copied on the original ? That's the best way to make
>> > > sure it doesn't
>> > > get lost.
>> > >
>> > > I'll have a look at it in the next day or so, now that it has been
>> > > yanked out of the bin :)
>> >
>> > I have been moving things to inherit pypi while moving things to
>> > stable/pike. By doing so we can most often drop the SRC_URI line and
>> > in this way we *should* stay current with the pypi best practices.
>> > This commit will conflict with my webob update that off the top of my
>> > head you merged this week Bruce. Instead of merging this I will move
>> > any recipes that remain to inherit pypi if that is alright with the
>> > two of you.
>>
>> Works for me too. Thanks!
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
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

