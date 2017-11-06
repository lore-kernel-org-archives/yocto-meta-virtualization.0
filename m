Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6C58E00D20; Mon,  6 Nov 2017 11:34:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C04DE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 11:34:28 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id w2so8823626ywa.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 11:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rlkUEkNMwpfiqFIfnPim3xPK95CxKWAHTveP5FBP8Vw=;
	b=QFny6FVB73CiIVydHDJFUpQ7MjMXX8Jb2m+0VyiOy4P+jkklhudaMFfhImDefM0v3y
	G1DA49emOwMX7LuHW6sZZewv6529z73IGoN0urSGkhBqX8k5UAz7xBZKktCiDEJHH7J9
	0OIZuXDo6rVpaQzKjlJF+yJGT7XWk1HyuZ/6wbEhfXEAHQNgpz8ngcFRvPH9l9S4P/+q
	cyfgBodKM1OI4KjatMOGHiKy3HzWg5lRY/Y2vbiSU4UugvK2ARm+d5LSWCTQwGr6oYkp
	Wmi5/E0MBXCoBj9hP1+zRLUdZr1/S6lDzFglLEyCoY6tUvB1dnWJlzLNXGw1JWKkVXCa
	rv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=rlkUEkNMwpfiqFIfnPim3xPK95CxKWAHTveP5FBP8Vw=;
	b=sucNBcVFy0U1+HocuQz47TMdZV7/WR5/R30rsHj1ErrycYag7N+AyFh1g8susE7WUf
	FHqic783lWqEeZPtrjODB3WPYTnWBifvKKr1tvpxmOrbhYH5p/z9Mb/u+Ui1i4snxuWl
	8QrhKVDxi7+erEAlb/8aey8IVvu0MVywsazYI14sZ3EOFS8TaZN+zsRqn2GuxRjaA/XA
	9p5YhO9SMXXCJzYa6Mq6hYfiPPxZkEwSwZOxiXd17iN2JVsC02+rG7nPd58wTNaK05HM
	KRF1pidmVJGSt8N5tbJeaz0zpjh1Hf8F9id0j7QlrM2iEMmvhuI8PzD9jSFtMzHytjcQ
	82ew==
X-Gm-Message-State: AMCzsaX8kn5yZt/tXpkmMo/Ak3YFVzaWlghJLHx/wCAmnk5C/yTQUKc8
	gMW2vU7ajeEFDOKeVwNDB3hHs9NduD2zZ+oy1XM=
X-Google-Smtp-Source: ABhQp+RTQoTC5y9pSnZTC5R/mPaWNrGefbx5VI/JcMT20ffyxTDRq7+gRq7OQzWhLxfppN80jAqGJMPUnbpd0wUHLZ0=
X-Received: by 10.129.40.14 with SMTP id o14mr10073762ywo.276.1509996868294;
	Mon, 06 Nov 2017 11:34:28 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.131.144 with HTTP; Mon, 6 Nov 2017 11:34:27 -0800 (PST)
In-Reply-To: <CADkTA4O8G=vP9Gi2KQadAOoHaNO-X5q9_F-ZckP9LgDPJGixxg@mail.gmail.com>
References: <1509810728-19704-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CADkTA4O8G=vP9Gi2KQadAOoHaNO-X5q9_F-ZckP9LgDPJGixxg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 6 Nov 2017 14:34:27 -0500
X-Google-Sender-Auth: ctZHXBWk9FGekOtwbnWXtyfkMeA
Message-ID: <CAPuovE+N4FaLa69Ok-FkKwy41R4vdy2n4EHy4g3XcPaz2N6xZw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-heatclient: upgrade to 1.9.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Nov 2017 19:34:30 -0000
Content-Type: text/plain; charset="UTF-8"

I never managed to get everything uprev'd to newton which they just
EOL'd 2 weeks ago :(. I was going to start to look at moving things to
Pike (and actually get things done this time). I notice this uprev is
for 'master'. What are the plans here, move everything to the latest
on master or are we thinking about moving to the Pike release?

On Mon, Nov 6, 2017 at 8:53 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> merged
>
> Bruce
>
> On Sat, Nov 4, 2017 at 11:52 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
>> Upgrade python-heatclient from 0.6.0 to 1.9.0.
>>
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> ---
>>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> index 26d86be..6653b37 100644
>> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>>
>>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>>
>> -PV = "0.6.0+git${SRCPV}"
>> -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
>> +PV = "1.9.0+git${SRCPV}"
>> +SRCREV = "b80166d848dd26718cfe0627bfec22774213616b"
>>  S = "${WORKDIR}/git"
>>
>>  inherit setuptools
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

