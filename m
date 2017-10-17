Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2295DE00C82; Mon, 16 Oct 2017 19:14:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.172 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41753E00B67
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 19:14:35 -0700 (PDT)
Received: by mail-qk0-f172.google.com with SMTP id b15so266014qkg.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 19:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OLzY9URCWFmMfK7VBFamieMKvyfW35N+w67dpL1vkfs=;
	b=pBTWMlFMz9GneDbbMdkE19rGq3HSw6zh6jX5y/EEtAmagAPJ6ICAO+0436CHVLriD3
	I0czc6bXK75xO8hgDraYILhCMhaT5qx2ZmEM4F1UeNtKxm+twPpoEvtTggUEXfSKNIXC
	lYCEpg6fhGG5SofPErA8dCCmIREqI83mAGEDuCktABZFyN29zoC8uKUBss9fjWFkL6cZ
	bjcZR34e6RJ+INZuiJy0Vjh24Pkp/PxsK3HoHyj7gb9uR/GcGtiL/eFHo/7fLF71YOHD
	9gNQopvh6/ddVMDS7OCoA+t8jofRCKGyuJg+YRtvU9l5g2t5SDCqtIh8r0DsjouSLZ4k
	cqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OLzY9URCWFmMfK7VBFamieMKvyfW35N+w67dpL1vkfs=;
	b=sHHp54RUrBouHlK1aeN0Iq7cyEKmZVAA2HpVvE8a6mq+uChBEU9YbV1gGB37c0VjpC
	sxrWLXeUUx42IQDvsU9IQ43RTIpyfWbvBfejLc08F+TA7VEEahdJiMEGm6SfnOuAmkOh
	1C0WeUGAVggz5woMPRK+vh30r27zEQAh7+FgjvHfPI3nMlzs1Q2zF2g4EwHtwXBaC72X
	+GYwTTRAnemL1iHDaz4QOI+FoN+JfmOMQmEEl7isww3AkgSrwIEmHitxQ/WY1EpCb3Zj
	ECtiX87VJuBKQ76x5+a68KX4ApjHP394yHcSUZol+TfxtBR2qxb0tZ325oEBc4qPgR2L
	xH6g==
X-Gm-Message-State: AMCzsaXQOo6+tmgpdFfFRigbvol2WHamPwN+2qDsIc6SE117/GLXgPwM
	oNpsV3imZ9FF4rcmAYGfQ3gabxxq9cMN96em43h0XQ==
X-Google-Smtp-Source: AOwi7QDNmWpYRyerRkzFXsq6rj+WapOpMqozD1mNFu/THnoHa51SqZ4aidlXlE+VV1KdmRZcUWGtZ6bMssx5Xh3Orp8=
X-Received: by 10.55.15.139 with SMTP id 11mr16443844qkp.141.1508206475249;
	Mon, 16 Oct 2017 19:14:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 16 Oct 2017 19:14:34 -0700 (PDT)
In-Reply-To: <CAAaKDhEiPZDEfVLSqaGGUig1iivJg2ymjQJ63G6VjLC+U62L3Q@mail.gmail.com>
References: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
	<CADkTA4NDa9GFu1vv420trVz+wL=Fr7tUHgM7NZk1jNoUGNztkg@mail.gmail.com>
	<CADkTA4MGDn9OuagD+8t2UVdqDza6N-hykwQ_GtNDLab40gTbvg@mail.gmail.com>
	<CAAaKDhEiPZDEfVLSqaGGUig1iivJg2ymjQJ63G6VjLC+U62L3Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2017 22:14:34 -0400
Message-ID: <CADkTA4PgM=TSeVXXVWA4jDywQurymAS6RkKd1KLk6LN6Z_QXwQ@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
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
X-List-Received-Date: Tue, 17 Oct 2017 02:14:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 9:07 PM, Ricardo Salveti
<ricardo@opensourcefoundries.com> wrote:
> On Mon, Oct 16, 2017 at 11:01 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, Oct 16, 2017 at 8:50 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Mon, Oct 16, 2017 at 5:17 PM, Ricardo Salveti
>>> <ricardo@opensourcefoundries.com> wrote:
>>>> runc.inc sets PV based on "${RUNC_VERSION}+git${SRCREV}", which is
>>>> set correctly by runc-opencontainers but not by runc-docker (PV was set
>>>> to 1.0.0-rc3+gitINVALID-r0 instead of using the SRCREV hash).
>>>
>>> Then I'll revert the .inc
>>>
>>> As I mentioned before, I'm keeping the named SRCREVs. I didn't notice that on
>>> the way in.
>>
>> I see the issue. I won't take this patch, but will fix things up a
>> different way.
>
> Cool, I didn't know if the idea was to use named SRCREV, but handing
> that differently in the .inc should also fix the problem.

yah. I broke it quite some time ago when I had to split the docker and
open containers runc.

I should have switched to using SRCPV then .. which I just did now
(and tested both the docker and open-containers variants of runc).

Cheers,

Bruce

>
> Thanks!
> --
> Ricardo Salveti



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

