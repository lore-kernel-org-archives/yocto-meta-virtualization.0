Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1597E00CD3; Thu, 12 Oct 2017 06:25:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.41 listed in dnsbl.sorbs.net]
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA202E00CC6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 06:25:12 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id f4so13385984wme.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KsbR0ELq7TsSe/6eNtPgeP9P7uBeNr6LacvGkX4Usi4=;
	b=jRTkBPK+1OUBGMerwMOMpW4Lycbo6taSI+NRYlW949Bb4CPtuTA5s9nv41YC663swu
	53l0AWSf1zkDp+kacVRe8neY7KAV9vBogtoROhPqi0cfNtcEpoSvu+Od/ayGGDHfsnnF
	AA+bZiTHmaqtnR7MMyhmkOARyRruYTW+qvFswyTbheKE5IQw85p6HP1bN0gpaqu0V0+A
	wn0EQfaNCBx5Rh7/hO6xniqFcr07W3c8gklZ5YkauMH+mHkcJBnQSNzVU8vWYV3xhd8W
	vpusK8Z7qINCCzXOTTMpvimpxgypRHVNuJVbPCmjYbg7H3xw5GJ+RXgvwtalB57hE8ej
	zbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KsbR0ELq7TsSe/6eNtPgeP9P7uBeNr6LacvGkX4Usi4=;
	b=mAKv900Raf/GWny1uPvUEZgXB6gHc3jGXZkoAiTv5pzCn0NmIC+kWgGyARnSc0hf7T
	eh/W9yJ9gVYAh3Fwd9hAeZcf2B+uTUsUFrdAVOZPzkFF8h1W0h5kWx5luEt7l35C6Crd
	ub3fhUvLir0tYUJRqKVzGcp7sUYVugFqudbCTFJ96AmUK8NCgKJC/34sVO6Ko8GD4SFn
	lQBxmvEdv5/PI3h7PrTDa4s44xnj4yzsq6OX8xdFdfIjChEGEsqst6FlAtfs4AnNQb0e
	lqIQav3pkY7+VO1bky6nVEk4k4bbwb1FuU07kS/7sS4IOWGBxQZoPNsgk0FsizBRYLaE
	QUtg==
X-Gm-Message-State: AMCzsaV4SG9HCjJtC4/oOBJcDeVC2JdjqMiq+SvNp0z0t8LCffnjAU15
	S2tGdquvTkG9v34IkpDXh43GCfumHtJarqQphiDoEw==
X-Google-Smtp-Source: AOwi7QCCQnNaZvS414fMBEkQ+W5L94lNKsC5y+/+KO+VjzXF0Wa6fzPK0/jDDDKUwU2zO/4o5gjT+pejulgoNojrCME=
X-Received: by 10.223.186.142 with SMTP id p14mr2313313wrg.169.1507814711625; 
	Thu, 12 Oct 2017 06:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Thu, 12 Oct 2017 06:25:11 -0700 (PDT)
In-Reply-To: <CADkTA4MiWQg8sR64EOB5+4wMtrnVoYO6Y6BOj6qvNCMxOcM07g@mail.gmail.com>
References: <20170930030617.21104-1-Qi.Chen@windriver.com>
	<CADkTA4NNPF4v4nArrR94Wcxp+kJi3c-5WXinU=qrqjxp2AQruA@mail.gmail.com>
	<CAPyrkgzrqg_XnGwByBz_uiP_r9kXixT9Dkk_jwoPkwtx=2mcJg@mail.gmail.com>
	<CADkTA4MiWQg8sR64EOB5+4wMtrnVoYO6Y6BOj6qvNCMxOcM07g@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 12 Oct 2017 14:25:11 +0100
Message-ID: <CAPyrkgxSQKJKePVsz-0gyNWjOATC1TKw9McuOmH5DV4dUfdfqw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V4 1/3] sanity-meta-virt.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Thu, 12 Oct 2017 13:25:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2017 at 8:48 PM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> On Thu, Oct 5, 2017 at 12:15 PM, Paul Barker <pbarker@toganlabs.com> wrot=
e:
>>
>> I'm getting this new warning up to 4 times on each bitbake invocation:
>> twice before the "Parsing recipes" line, once after the "Executing
>> SetScene Tasks" line (if present) and once after the "Executing
>> RunQueue Tasks" line.
>>
>> It's also totally irrelevant for users of a distro like ours (Oryx
>> Linux) which includes meta-virtualization for runc, docker or other
>> related tools but doesn't use kvm or xen.
>>
>> I guess I can set SKIP_SANITY_BBAPPEND_CHECK in our distro config but
>> this sounds like a universal skip for all sanity bbappend checks - is
>> this intended? Or does this variable just apply to the check in this
>> layer? If it's specific to this layer I think it needs a better name.
>
> Fire off a patch to make the name more specific and I'll merge it right a=
way.
>
> I'm actively testing some other things, and have the distro flags set,
> so I'd like a patch
> from someone that was seeing the warning, and can confirm that we can act=
ually
> disable it.
>

Patch incoming as soon as my current builds are done :)

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

