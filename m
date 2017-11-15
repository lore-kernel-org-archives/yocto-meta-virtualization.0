Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 145A7E00D07; Wed, 15 Nov 2017 14:01:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C812AE00C45
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 14:01:08 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAFM16Zx016442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Nov 2017 14:01:07 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.24.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 15 Nov 2017 14:01:05 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 15 Nov 2017 17:01:04 -0500
Message-ID: <3347450.DjnDkdCT8L@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-38-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <4fc1f3af-2c4f-7fe8-f2f1-12023f3b79de@windriver.com>
References: <1510768793-27481-1-git-send-email-mark.asselstine@windriver.com>
	<2041101.pqKFSuxYtT@yow-masselst-lx1>
	<4fc1f3af-2c4f-7fe8-f2f1-12023f3b79de@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python-*: fixup postinst scripts
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
X-List-Received-Date: Wed, 15 Nov 2017 22:01:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, November 15, 2017 4:09:01 PM EST Bruce Ashfield wrote:
> On 2017-11-15 4:08 PM, Mark Asselstine wrote:
> > On Wednesday, November 15, 2017 8:58:36 PM EST Richard Purdie wrote:
> >> On Wed, 2017-11-15 at 12:59 -0500, Mark Asselstine wrote:
> >>> Checking for "$D" and doing an "exit 1" now results in errors such
> >>> as:
> >>> 
> >>> [log_check] warning: %post(keystone-cronjobs-...) scriptlet failed,
> >>> exit status 2
> >>> 
> >>> during image creation. Instead of escaping the script for "level-1"
> >>> (image creation postinst) we wrap the "level-2" (first boot) postinst
> >>> in an if statement. This also ensure the scriptlet in
> >>> indentity.bbclass is less prone to behaving differently based on the
> >>> postinsts defined in the classes which inherit 'identity'.
> >> 
> >> I think this could mean the postinst doesn't get executed at all if
> >> there isn't an exit 1, else how would it know to defer to first boot?
> > 
> > Every time I touch the postinst I admittedly end up in a knot. I was
> > inspecting the rpm scripts and all seemed well but I will take another
> > look to ensure I am not being a dolt.
> > 
> > Either way thanks for the nudge Richard. Bruce hold off on this one for
> > now. I have so many little and big changes to get m-c-s back up to snuff
> > I am better off taking the time to ensure I am not messing something up.
> 
> hah. I already merged this one, so rebase and send any fixups.

No problem. Seems Richard was correct. I saw the scripts in the RPM and see 
them logged on first boot but they are in fact ineffective. Adding the exit 1, 
however, marks a return of the log_check warning, so I will have to look at 
what is going on there.

At any rate I need to go through each of these postinst scripts one by one as 
they are all out of date, so overall this will not be a cause off any 
additional noise.

Mark

> 
> Bruce
> 
> > Mark
> > 
> >> Cheers,
> >> 
> >> Richard



