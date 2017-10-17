Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6688E00BB7; Mon, 16 Oct 2017 18:08:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.47 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C625E00B53
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 18:08:22 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id d10so107459lfg.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 18:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UwzhdYgUbNwBt/T4C8NDR45xh0YUfsiNzzBvRNv4m8k=;
	b=ew8uM8MTUwzlRAfBdnCOaI9qaG10MArvPK26QUb6aK43L2a+amEo4WoG+ZF5FtsZ3X
	4qzBl8l5sUp1FnH/j9RsgJ7v3+mAE+3Bnu30LUCiZ3vwTDv3i7N5cfwqoegeVNtC92Cm
	9HCJl50Axv/lQDDl33jMhsC++N5VmzNeL4KMmzgDhoL6azqWXA75ovXJcXn9y1S4KXfF
	LgAna/8mKmU3U9wocgwg/fUwSHArGxcMqlCclbNbuD6GwDompS7VgxoHjjqaqVJx4DCL
	YQ3BQZaau7ArUDIJbPyhUWfuKwsvZzPi069Tp0D7d5L2R9u+Ru4Cy6HG44cfkTTDkYrX
	1FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UwzhdYgUbNwBt/T4C8NDR45xh0YUfsiNzzBvRNv4m8k=;
	b=ZNaMeS47nJka9PvxVKCW8tsCb3UKI+9G9TKvPWO0VuRHhtkkYlq7VBkZkLiX6ybEe+
	r/OjvvLIfUdMG7f7oqtQQPGJRIMwfEWuqPGu12G1OBAhLGG3JZM8N9PQ+crqFbQkJTOK
	tIQLwUUPE8CsmJoiAl2lqENLjWTA4TOqcj4ekxLXbTcSYCLyuW17XFIvLEtQCNfiWLrs
	91L7eADzbxT4ZeOhdkPXUR3Q5zGa+mzuA2pG8SW8Ux48gswbecS5VYh/ULX77eYw2e7z
	oUJL7e6l7J+osnjAxBlPckh2eWUactWD0xrzf4OI1XLT+RXXg+/UGJx7INMpw45EwP/n
	A4Tw==
X-Gm-Message-State: AMCzsaWkPEFiIxlw9f1mi8phqhx5U+BOh4sUceofGdVyquA71JTV1AbV
	jeXIkECyy9oLf6C6ubDJriTyru/LM6D4orrvepBJ
X-Google-Smtp-Source: ABhQp+TONnnV2pnBnSvPsnyEX8EQNQ6V831RtlzWqguStLCaJ7uLNg57Aeim1wGnOEZohOHGiRPcs3owc0Ofp1mlxD8=
X-Received: by 10.25.225.144 with SMTP id l16mr3846439lfk.53.1508202501867;
	Mon, 16 Oct 2017 18:08:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.233.88 with HTTP; Mon, 16 Oct 2017 18:07:41 -0700 (PDT)
In-Reply-To: <CADkTA4MGDn9OuagD+8t2UVdqDza6N-hykwQ_GtNDLab40gTbvg@mail.gmail.com>
References: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
	<CADkTA4NDa9GFu1vv420trVz+wL=Fr7tUHgM7NZk1jNoUGNztkg@mail.gmail.com>
	<CADkTA4MGDn9OuagD+8t2UVdqDza6N-hykwQ_GtNDLab40gTbvg@mail.gmail.com>
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
Date: Mon, 16 Oct 2017 23:07:41 -0200
Message-ID: <CAAaKDhEiPZDEfVLSqaGGUig1iivJg2ymjQJ63G6VjLC+U62L3Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] runc-docker_git: use SRCREV instead of SRCREV_runc-docker
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
X-List-Received-Date: Tue, 17 Oct 2017 01:08:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 11:01 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Oct 16, 2017 at 8:50 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, Oct 16, 2017 at 5:17 PM, Ricardo Salveti
>> <ricardo@opensourcefoundries.com> wrote:
>>> runc.inc sets PV based on "${RUNC_VERSION}+git${SRCREV}", which is
>>> set correctly by runc-opencontainers but not by runc-docker (PV was set
>>> to 1.0.0-rc3+gitINVALID-r0 instead of using the SRCREV hash).
>>
>> Then I'll revert the .inc
>>
>> As I mentioned before, I'm keeping the named SRCREVs. I didn't notice that on
>> the way in.
>
> I see the issue. I won't take this patch, but will fix things up a
> different way.

Cool, I didn't know if the idea was to use named SRCREV, but handing
that differently in the .inc should also fix the problem.

Thanks!
-- 
Ricardo Salveti

