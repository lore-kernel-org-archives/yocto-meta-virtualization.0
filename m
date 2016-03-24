Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34CC5E006CA; Thu, 24 Mar 2016 11:09:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD576E00443
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 11:09:22 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id p65so6431382ywb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=jppBism/ihAPUCyXdIPvBnAYANODvDrT+ppYxBCwOJ0=;
	b=ADbRwbNYsLX7SewuZ56isHsaJRwHsHq6q/ht06B6hR/LcYoFhXTUD3HbUGrmf8Ip+E
	W5CDVh9jAa1v1q+AifPHzfUIkc/5OMIoJZILMFFX47eoG9J9kdGCFKuhcgjYzg8n01gT
	oA1ZEM3iZTWTYlTgZT/ocefKMo8NJUjjkrjps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jppBism/ihAPUCyXdIPvBnAYANODvDrT+ppYxBCwOJ0=;
	b=fbInpPhiJA1YxrQv5LkrBUj9oy8aWAlGu4/mqH/r0EeEqpq3L1PscYsbdc8G12qUnj
	V2YYYSPIygcI7B0GGVuGLMaNBNaNM/lLAMriWWmazvKUTbPR2asHWZJyBLfdNkHJwymf
	dIOBNgPMsxDXkflnu2Pa+/a6lv9saUhFntbnevz2X3nR6eK4PIg1Y5w6e4EWqO7wFc+H
	vpzN1mo9BsK8EIcOqwhtepY1osjlALju3wmoDPDhS+PSpp2NwxTYRq/0+VfNyih8VVan
	qH+CybgRSEWgC4WisdvH/UeX3jey7OhE0RjAgsAdq2dppsBcXRML/Nm1m0yoJPpc66dO
	noLw==
X-Gm-Message-State: AD7BkJIXkfzJVtKy4tq4BTDkVv6FfyvMoM0XSN95zSawv6E41TSV/syGp/Wa9BW540MNBQ==
X-Received: by 10.129.93.4 with SMTP id r4mr4877153ywb.60.1458842111726;
	Thu, 24 Mar 2016 10:55:11 -0700 (PDT)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	p189sm5109913ywc.44.2016.03.24.10.55.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 10:55:10 -0700 (PDT)
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56F429FA.7060001@cardoe.com>
Date: Thu, 24 Mar 2016 12:55:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458833491-7717-1-git-send-email-derek@asterius.io>
Subject: Re: [PATCH 1/4] xen: split the flask package into a policy and tools package
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
X-List-Received-Date: Thu, 24 Mar 2016 18:09:24 -0000
X-Groupsio-MsgNum: 1854
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="lmNXSaXGdxHVCUmxsSrJNleUkDIC1tLUC"

--lmNXSaXGdxHVCUmxsSrJNleUkDIC1tLUC
Content-Type: multipart/mixed; boundary="52TnrxIDOi1GJh2nhtOMio20R2Gdo0q1p"
From: Doug Goldstein <cardoe@cardoe.com>
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
Message-ID: <56F429FA.7060001@cardoe.com>
Subject: Re: [meta-virtualization] [PATCH 1/4] xen: split the flask package
 into a policy and tools package
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
In-Reply-To: <1458833491-7717-1-git-send-email-derek@asterius.io>

--52TnrxIDOi1GJh2nhtOMio20R2Gdo0q1p
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/24/16 10:31 AM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--52TnrxIDOi1GJh2nhtOMio20R2Gdo0q1p--

--lmNXSaXGdxHVCUmxsSrJNleUkDIC1tLUC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJW9Cn9XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU5noQAIO5vVZYMOjz8gLxsTISble3
c58lT9nNQjiwn2jfLL2K5pmVcar4CP6nclbcj/IEudhl5URMCmXFgpJNaZdTpxjF
/ytABv6UWs3vHjQ41zdenTKgI4ARY+LfLRcGYJJj7ObDTsb4HWO5xGaLH38dPZ4S
1d/eyRmqdsEDS8mrSHcBM2zi8ibeohNirwUBE3FAvTAf0V//Q+gQGS49QHl3yHDs
t/Ahm0Fv7VOFqkSZKTZLidA7fvl5OVg1KqtjT1Doz2gCeugNGzF82q7d12fXTt8P
fCjgYajsGd6uOgHVbu221Welk4qj+N5W69UmenX9wj1Dss7CoLh9s64GV+SHqdCH
yD24BetIzLvdMgwDIsXN+Clg2lx7SbYwNNaTZSNZC0OdI1xlN7YZDtSFV81T/PVL
63+Dq5mmZDtdj1cibrZup3BNNEirODSPUG/C6Ue/ulNsanSS8yDkhqwn07MDrDBq
Parxavo+WLABHLMCmNWf/aiWvCy4D9crnq3C+buAeyT4dIl5fEDErmofkn5zh4Dd
OuWSNnggIpHLMdhyb5aZEB+u811PkanT+GVctAPQJRuQZNt/3fb+58njH8fXCks8
x1rpkNJkxA+ZLu1ZKzJ0PCdTQhTcyVL+VdNb2KDzjbHVfQJUsseuK9ISgf3f80xl
FQLoAsXAz2P64owvmy8h
=dqeC
-----END PGP SIGNATURE-----

--lmNXSaXGdxHVCUmxsSrJNleUkDIC1tLUC--
