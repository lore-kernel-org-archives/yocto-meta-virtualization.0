Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBF59E00B70; Tue, 22 Dec 2015 06:26:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11088E00457
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 06:26:16 -0800 (PST)
Received: by mail-yk0-f182.google.com with SMTP id 140so165016190ykp.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=1NQVtocMOjw9399OH5tPjO/VD6PcWqDcU/dkcmvBAu4=;
	b=pEUPNpTzhsngjgKsC/D7rUJei7/YF+jroVBIWgWfC9ZpGtenPPFEQ9VXBAFU1hbbp+
	0pz/S2RB5z4042x7Z6QsY+MtsKlHL59ZwvFMHhLn1cMrbuba0VWcFo5DLTDVRsQSTAa5
	WRujQRUjZQE9xzJd4eOR174i5RFPRNhXWxlJiFq1NF8xyGTCIbB/4lgGYazMs0ncbe+j
	5vphltC4v2mMdId9OQVfxAUN8b8l19f4cTqj7zfjcFBvoOA2UnIK916uBg3YgMNxIqBg
	MDZQlSRn/1E6qt1G6k/e9Sh/5ir5ik95cJMBW2Ex6hqBTROQmO0aHvsiHz0iCdHp1VYP
	2+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=1NQVtocMOjw9399OH5tPjO/VD6PcWqDcU/dkcmvBAu4=;
	b=gxfp9U1N8LOh5DUEOKLWW9swPgnr5h0R/TU9CuQ4m9SKjgosl87tppid6Txa1hI5sj
	68j/LEA9mRyPK3SEOXt2gHGBp2pCYa2o2nZwhf+EmSH8m8zRicBeStQ3lbau4pkNGQLJ
	SdYJbhEA4nfMazo2TkPKpitJNQVLGiH49acVJVsdZrq13qNBlvG2yLFjj7eFiC1ENFsq
	UQyIqqThwZVR9m0gsF8hWjE6nB77My4IIfHTMxEWQVm1wNiHYB7cg73J1mUGOnoqQtWU
	BUB0aoiI9Ou+jMLcbx4k51CDp8RdDL7iAZ/pEZSAeKj2P4hjNKiQVXnTBlIkD70z0itn
	w4yA==
X-Gm-Message-State: ALoCoQkcrLVhKHpN96388fKGdwdAH+fgpGShT+en/QScq3c+tVa9QTWWIKmxJmwHaQCtYKmcLOyho8uTZeSuoI3KRlFUZ8KLjA==
X-Received: by 10.129.43.86 with SMTP id r83mr18888268ywr.148.1450794375954;
	Tue, 22 Dec 2015 06:26:15 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	i3sm11849767ywc.52.2015.12.22.06.26.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 06:26:15 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
	<5678E380.5070100@cardoe.com>
	<CABZSBQcv5sN27398FjimLBixQ0JSxKUr+nwRs+3JwRunzeWscQ@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56795D81.9020302@cardoe.com>
Date: Tue, 22 Dec 2015 08:26:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CABZSBQcv5sN27398FjimLBixQ0JSxKUr+nwRs+3JwRunzeWscQ@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] xen: uprev to 4.6.0
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
X-List-Received-Date: Tue, 22 Dec 2015 14:26:18 -0000
X-Groupsio-MsgNum: 1608
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="2AOQ4ljiTNWt33vCus7XfaNDDkLk3lH8X"

--2AOQ4ljiTNWt33vCus7XfaNDDkLk3lH8X
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/22/15 7:00 AM, Chris Patterson wrote:
> On Tue, Dec 22, 2015 at 12:45 AM, Doug Goldstein <cardoe@cardoe.com> wr=
ote:
>=20
>> Any reason why you can't work with upstream on a solution to the heade=
rs
>> cross compile issue?
>>
>=20
> I wouldn't declare that it is a bug, but it sounded like upstream just
> wasn't "finished" yet.  If you look at the commit that introduced it,
> it was deemed to be "simplistic" and was meant only for native builds.
>=20
> commit 6f1d3ce238905fc7b4c563a3611576ca25a09a49
> Author: Keir Fraser <keir.fraser@citrix.com>
> Date:   Wed Jun 17 07:21:03 2009 +0100
>=20
>     Introduce mechanism to check standard conformance of headers
>=20
>     While pretty simplistic, it appears to serve the purpose at the mom=
ent
>     (i.e. it spotted two places where a GNU extension was used withou
>     proper preprocessor conditionals). The "simplistic" here includes t=
hat
>     the checking gets only done for native builds, and ia64 gets exclud=
ed
>     due to its arch-specific header intentionally (for whatever reason)=

>     checking that anonymous struct/unions can be used.
>=20
>     Signed-off-by: Jan Beulich <jbeulich@novell.com>
>=20
>=20
> Since it appeared to be a sanity check (for developers?), I didn't
> think it was worth digging in too far.
>=20
> But since you asked!! I did revisit and it actually looks like the
> root problem was that CXX is being dropping its OE cross flags (most
> importantly, --sysroot).
>=20
> It appears that CXX needs to be added to the list of variables updated
> in ${S}/config/StdGNU.mk.  I'll fix that and post a v2 shortly :)
>=20
> Thanks!
> -Chris
>=20

So actually the only variables that should be sed'd are LD, CC, CPP, and
CXX. I actually tracked this down a while back and I've got a patchset
that needs to be submitted that contains a number of fixes for 4.6 as wel=
l.

--=20
Doug Goldstein


--2AOQ4ljiTNWt33vCus7XfaNDDkLk3lH8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeV2GXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUszsP/jIW4i6T1AR+ZPQlCnfOAJ2a
1r1js917tf6hor4zIRKehu3oJhCHSMhWGvweBjw+8U+/T+SAMtMkklXo2la1+wsA
WqgH0+0VjjtoHP1FcVGlolJRiX33HeVxkZmQWI2s2wGy9Wb4rDfN3HvxxJAzhNSq
mSXITNO3Nq++M68hx7QeptZg49s/1+/XJNhyzqSHFBeBkzPpdLSNTU51Mv8FGkTV
kdwAJr04XFo+2PrH+JriEn3yTlmDRUvQihYgT0uaVLXRcyE32hnn3Zh2xQn2urBC
18ajqFJsRYgFiKjGWPNZFNuorkkpA6SFa/EL2RzaBOle750iCP4813NAfqWXsosX
X/n6iICbVOgSYYYH8WECnXc0mEn5c4TNuWBWgmNX7pbfXSHUf/DwLetLufqbgKWi
UG/Z2qqtbprcyiYi4H1UqNc+qJM2WJgRYo4jDl3GkZE2Fac2FpM4GDhYPqQLR18L
EHRmvLnkATzYV8yGvAmi1L5Zw/WH9YdH3FIH1H4TCPgGckHRJ5YvMQnICWeWOlNe
Im27XARrU7vWn0SlrouPRi3Y7h0u9C6Q0so+QYZUmBBqTfpSeqLhjswPF+kSTxc6
O9O03B/hgiq6pUkkukeSQPacY2MTYLxFVqX7tvUGEnunANGNAA7GyIMd9AJKU/LO
RRAg6n0YSiarlfu9waum
=aY3X
-----END PGP SIGNATURE-----

--2AOQ4ljiTNWt33vCus7XfaNDDkLk3lH8X--
