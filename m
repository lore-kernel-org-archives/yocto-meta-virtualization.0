Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E812E00770; Wed,  7 May 2014 06:21:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.171 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF57E003C7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 06:21:02 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id 10so1347535lbg.30
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 May 2014 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vJS0Xp9IvtdJX4H8ldUn3Ufzy+JFwJ9kBbhpMqHwuok=;
	b=xLkw4AzkC8GHmOZViuNdz7x8yDMwxI/+0icwMVE6M7N0d6e5nE3tR2bkzuyBnLShT7
	asQ1yzFJMldi2i7BxyNGoZEgwbxi4ELw0tSR2/GEHYTr8S1HTR275p+Y3lix5DjsAPV9
	Bv9dFMMqCYlh6a3pAa/9JOpa9L4OH3uznzXJ8qyOYK9nFiAzz++XEfI0O/c9xh3XqvoV
	GcbuNMxzU6A5gnB/GGjcEO2uvuMZ3GbDBJH/jAcjb2H+Nr1t/3h1jApmQVWbe1e3cW2X
	1Heug3CQOPOUvlyLOmeQN2+Ofv6CpKDAQImkI+IRyizYDK9qiVO76J31WDjhEcm/jmSC
	E6IA==
MIME-Version: 1.0
X-Received: by 10.112.13.72 with SMTP id f8mr4988157lbc.40.1399468860967; Wed,
	07 May 2014 06:21:00 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Wed, 7 May 2014 06:21:00 -0700 (PDT)
In-Reply-To: <20140507131642.GB18437@iapetus.enea.se>
References: <20140507124513.GA18437@iapetus.enea.se>
	<CADkTA4NXTB558rHETszFB9WuRwKEWRvr7gwRkDfhJB_fMhwxgA@mail.gmail.com>
	<20140507131642.GB18437@iapetus.enea.se>
Date: Wed, 7 May 2014 09:21:00 -0400
Message-ID: <CADkTA4P1UoOQP2FLQVv9_6JnLSKPmq4nYwHy2f1aPVR56sk_fg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Joe Slater <jslater@windriver.com>
Subject: Re: libvirt requires libssh2
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
X-List-Received-Date: Wed, 07 May 2014 13:21:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 9:16 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Wed, May 07, 2014 at 09:10:47AM -0400, Bruce Ashfield wrote:
>> On Wed, May 7, 2014 at 8:45 AM, Josep Puigdemont
>> <josep.puigdemont@enea.com> wrote:
>> > Hi,
>> >
>> > A default dependency on libssh2 for libvirt was added recently. Where is libssh2
>> > provided? I can not find it in either meta-oe or oe-core.
>>
>> Joe ? Did that leak in from something local to you ?
>>
>> Regardless, I'll revert the change for now.
>
> Maybe we can keep PACKAGECONFIG[libssh2]

If that doesn't map to anything obvious in the yocto ecosystem, then I wouldn't
want it to be available at all. Otherwise we'll pollute the options
with internal/private
fields in a public recipe .. which isn't what we want.

I obviously should have done a build test on this one, but instead
assumed it was safe
... lesson learned.

Bruce

>
> /Josep
>>
>> Bruce
>>
>> >
>> > Thanks,
>> > Josep
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

