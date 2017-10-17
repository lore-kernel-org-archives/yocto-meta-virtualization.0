Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12CDDE00C82; Mon, 16 Oct 2017 19:21:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.49 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7926DE00B67
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 19:21:04 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id n69so246077lfn.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 19:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BOUTUkD8bTapssbqDr0t0KDYj7y6T4DI6wGPDJm5Q+s=;
	b=J9wsaE5Y5zBvdkdaO5bPmMkg/OvDIiu1QIWbVjnIQZsGnrT22WnfS2d8vrHxz25d+A
	M8BQVNuaxv24dFJRMsrZjT0RfXe1fM2vdrcnWNULRF1/9c3eo8LbkmEk0sRhbpOtM1Q1
	tCU7vU26gB6mkm9WL4YrQ53SlxthsCZJkv+jyRssax7FSNew1qg4gRTf9jO3PlvHo1jF
	PkLpt+NI7z/GJkZy7QFX7wCRD0/vetF2rhgWu4xB/MBa2XeUEe4sVLh6qxO9OsS2nplk
	WzsFTJUaEivHXLpgTiRke1LjPlCpcSfriCj7yBbbVLMAdqHoe9Qru3DS5qQ5wWI42jE6
	NksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BOUTUkD8bTapssbqDr0t0KDYj7y6T4DI6wGPDJm5Q+s=;
	b=uFf0cO3q0phVB8rc+sPr2amZxJ1Ocz2ZOcWWkVkJfJOinBccRb36WxMg222zOFIeJS
	LgZWkFuL7v5xb83BcRcVbzWRzYdHaYSuGrQnrHewxYZIoxjjSyQS3UP9ffp1PHEticsP
	cjiHdvKUgiO6NudpT1dAcz0QzZVjOLwG+vNqIdIuyjV7QsZL1PV8MBK7NwbLlcJlHatv
	Qj7sUtv4NZHw5eiFG2REA0te5QNZONbL2m5rauJEPgbWk5Q4kaxrk0/s1DZbtSgenXTu
	lm4UxiIh01YICccTu24Iw/8RMjB0K64ysL/Pmv7DiXFiqK8vFf/5DngtaDK9hzE+m+Kx
	8Y7w==
X-Gm-Message-State: AMCzsaWoHNycxKqNxlswh9cesoCPsIlZokEKrCHiiVFv2oUIpX7nX3Zf
	Z6Y33n58E4WeUnhz+ydLnF/x10ZpXTUPzVPbv/xD
X-Google-Smtp-Source: ABhQp+Sc3um6FSB/hD+83asTlc8JEsOFEfPuO6HUPnuF+7icYYMsHg5MXJJeAVpHF+GooLsEM3Q6FxnTkZ5OBkYAbxc=
X-Received: by 10.46.47.7 with SMTP id v7mr153565ljv.192.1508206863203; Mon,
	16 Oct 2017 19:21:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.233.88 with HTTP; Mon, 16 Oct 2017 19:20:22 -0700 (PDT)
In-Reply-To: <CADkTA4PgM=TSeVXXVWA4jDywQurymAS6RkKd1KLk6LN6Z_QXwQ@mail.gmail.com>
References: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
	<CADkTA4NDa9GFu1vv420trVz+wL=Fr7tUHgM7NZk1jNoUGNztkg@mail.gmail.com>
	<CADkTA4MGDn9OuagD+8t2UVdqDza6N-hykwQ_GtNDLab40gTbvg@mail.gmail.com>
	<CAAaKDhEiPZDEfVLSqaGGUig1iivJg2ymjQJ63G6VjLC+U62L3Q@mail.gmail.com>
	<CADkTA4PgM=TSeVXXVWA4jDywQurymAS6RkKd1KLk6LN6Z_QXwQ@mail.gmail.com>
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
Date: Tue, 17 Oct 2017 00:20:22 -0200
Message-ID: <CAAaKDhHE_+dXCTXsMd-rJo-vNKeArCw0EfdnexooqHB99HHFjg@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Oct 2017 02:21:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 12:14 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Oct 16, 2017 at 9:07 PM, Ricardo Salveti
> <ricardo@opensourcefoundries.com> wrote:
>> On Mon, Oct 16, 2017 at 11:01 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Mon, Oct 16, 2017 at 8:50 PM, Bruce Ashfield
>>> <bruce.ashfield@gmail.com> wrote:
>>>> On Mon, Oct 16, 2017 at 5:17 PM, Ricardo Salveti
>>>> <ricardo@opensourcefoundries.com> wrote:
>>>>> runc.inc sets PV based on "${RUNC_VERSION}+git${SRCREV}", which is
>>>>> set correctly by runc-opencontainers but not by runc-docker (PV was set
>>>>> to 1.0.0-rc3+gitINVALID-r0 instead of using the SRCREV hash).
>>>>
>>>> Then I'll revert the .inc
>>>>
>>>> As I mentioned before, I'm keeping the named SRCREVs. I didn't notice that on
>>>> the way in.
>>>
>>> I see the issue. I won't take this patch, but will fix things up a
>>> different way.
>>
>> Cool, I didn't know if the idea was to use named SRCREV, but handing
>> that differently in the .inc should also fix the problem.
>
> yah. I broke it quite some time ago when I had to split the docker and
> open containers runc.
>
> I should have switched to using SRCPV then .. which I just did now
> (and tested both the docker and open-containers variants of runc).

Awesome, just tested your patch and all good from my side as well.

Thanks for the fix!

Cheers,
-- 
Ricardo Salveti

