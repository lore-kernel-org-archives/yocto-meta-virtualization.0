Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01124E00CC5; Tue, 22 Dec 2015 07:12:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75EC7E0082E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 07:12:53 -0800 (PST)
Received: by mail-yk0-f182.google.com with SMTP id v6so166245821ykc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 07:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=fzW6N32/kTSdmYrwU7QgXOoZjknJnKSINsr47Vno9Wg=;
	b=kP6l11zOSr7T1p9wt7V4ITSebMPQDpo8QfUhl7nK5lwN8IVwtvrwEcjb4CrcG8kiWv
	g/bMMjeDS3xJ7U0kkm8vpscJm2tR5POmLS3gJncGDdIpUTPbL73A23q5l5gGdhwqJPvL
	8eJk4j+BEHIHk4k43u4q8jiFQA/2WvHFOh7Rrpf2Bx0em2p/E8cX+PVL8oFm/KKtrvxY
	mRijEL8KUQRINuaUEM4LFuY12L5qErQ0PR/HH8zR+EqbiCBjVtNwSGjbxzjg4BGyHpA6
	txmW+t46sUlZZYSs0HzFGnMUH41zX7a/wFFQ7uThVHmV2B5+L2t2JaklwsjZCT2u4hHt
	NNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=fzW6N32/kTSdmYrwU7QgXOoZjknJnKSINsr47Vno9Wg=;
	b=LFMn4hr0I9ruZR+OlnZa3YjlmagFzwVeAmM5MVDrT+Z54y7jHbU3G3SIe9+GNiD7EE
	lLxs3YKce6CWPfKe2TKf1fnxYlTqOJCNdj+6bNGFtB/PdYVj+qzEaVyvTT6rPwYbpdXf
	/kajuaxnSS9dso0IB4cxe0w6MCVw0H90se6krOynUS5pZsFghjq9HQRpjBjSuclocIzy
	rVknHFJ+mcoIkRzfRzM8td1aurXmW250PO35mgeBNC2wEWwbWZuengw2em/GijGep5Y9
	n8Hd5edHqiRvgp3Z1sjDCPwNPpVGDE47Id9dvav3kLqjsup4cldSF+Mtr3NLGeQLj+4j
	CzgQ==
X-Gm-Message-State: ALoCoQkWsjLIDu5fEEbuPMZT1+XMpWqUb5jUfBzqGYfxhgZuKZekr/AgY8Qv8D7vyB2j5/od8QObp4O1gFE1lpcY3gCIv7Gl5A==
X-Received: by 10.13.215.7 with SMTP id z7mr22150227ywd.343.1450797173101;
	Tue, 22 Dec 2015 07:12:53 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	w184sm33060117ywc.41.2015.12.22.07.12.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 07:12:52 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
	<5678E380.5070100@cardoe.com>
	<CABZSBQcv5sN27398FjimLBixQ0JSxKUr+nwRs+3JwRunzeWscQ@mail.gmail.com>
	<56795D81.9020302@cardoe.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56796870.20400@cardoe.com>
Date: Tue, 22 Dec 2015 09:12:48 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56795D81.9020302@cardoe.com>
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
X-List-Received-Date: Tue, 22 Dec 2015 15:12:57 -0000
X-Groupsio-MsgNum: 1612
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="8qgfQN42cB3iXBu2P5bjAboJRNcI7TeE1"

--8qgfQN42cB3iXBu2P5bjAboJRNcI7TeE1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/22/15 8:26 AM, Doug Goldstein wrote:
> On 12/22/15 7:00 AM, Chris Patterson wrote:
>> On Tue, Dec 22, 2015 at 12:45 AM, Doug Goldstein <cardoe@cardoe.com> w=
rote:
>>
>>> Any reason why you can't work with upstream on a solution to the head=
ers
>>> cross compile issue?
>>>
>>
>> I wouldn't declare that it is a bug, but it sounded like upstream just=

>> wasn't "finished" yet.  If you look at the commit that introduced it,
>> it was deemed to be "simplistic" and was meant only for native builds.=

>>
>> commit 6f1d3ce238905fc7b4c563a3611576ca25a09a49
>> Author: Keir Fraser <keir.fraser@citrix.com>
>> Date:   Wed Jun 17 07:21:03 2009 +0100
>>
>>     Introduce mechanism to check standard conformance of headers
>>
>>     While pretty simplistic, it appears to serve the purpose at the mo=
ment
>>     (i.e. it spotted two places where a GNU extension was used withou
>>     proper preprocessor conditionals). The "simplistic" here includes =
that
>>     the checking gets only done for native builds, and ia64 gets exclu=
ded
>>     due to its arch-specific header intentionally (for whatever reason=
)
>>     checking that anonymous struct/unions can be used.
>>
>>     Signed-off-by: Jan Beulich <jbeulich@novell.com>
>>
>>
>> Since it appeared to be a sanity check (for developers?), I didn't
>> think it was worth digging in too far.
>>
>> But since you asked!! I did revisit and it actually looks like the
>> root problem was that CXX is being dropping its OE cross flags (most
>> importantly, --sysroot).
>>
>> It appears that CXX needs to be added to the list of variables updated=

>> in ${S}/config/StdGNU.mk.  I'll fix that and post a v2 shortly :)
>>
>> Thanks!
>> -Chris
>>
>=20
> So actually the only variables that should be sed'd are LD, CC, CPP, an=
d
> CXX. I actually tracked this down a while back and I've got a patchset
> that needs to be submitted that contains a number of fixes for 4.6 as w=
ell.
>=20

I just pushed my most recent branch. Feel free to grab any bits from
here for a v2.

https://github.com/cardoe/meta-virtualization/commits/xen-fixes

--=20
Doug Goldstein


--8qgfQN42cB3iXBu2P5bjAboJRNcI7TeE1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeWhzXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUVu8P/28uv5cWzG+7nHn38zhvYMCW
AyWzWTm5zFmI9ewkmAOlnVD5olqSULhRagk0zDxAGMtdnQmCuG/98YhTzTfUp/ZQ
n/aWUY14/NwMGXLmiarOvp0ib5YFaHzIgkZiOlyGhWaxiGqpLiLxH6XAGsx06CrJ
YTgWmk8NrCEpXupTpjRI4SXsEQxwbrz0J+OCNgmUvpJSq4LPQfnXlv6KbAmY1wS8
dM+iFr58BajSBrZjgQMupZ+NQWNF7ydOxwsZFlI/f1Bm1LNe/B7tFFUGjdsfT9ND
f6CEGLVVSQgFnQSRTdaheChiw/LtiMbkk2+GDDgi7F+NGu6cyHqFIQTQnC+F/2LC
/U8xNIjjZgMEeSH5FCj0vdJiSlT59RAQi5wGerOukvMN1DXqnbR13MyGzwivzlUx
VZo05MycXbbC+TDfhkQaYtQNhFMCm/84fmX49HXUk+YW4SeMK+b/0+i0ZVxuSeHr
ohQ7zzRraJH+n2uYiKiuZ5JYk+mrBrn7vxdXSYLNM5y1qPCB+1axHNJTBUbbibZT
sQTtmyaXh5muWlKzdeROMXGJOBlBr38W51qtTlDBCme7C6zZTKVOcR+eLpP/WLiM
3dQvGMtQW3bOIWAZmzU2abCxFudgYeQpxZcdtqYth5PK2zL4+CQjENX6PdRgfgsG
+hKGgNvErzfhQ3WxNveM
=5T27
-----END PGP SIGNATURE-----

--8qgfQN42cB3iXBu2P5bjAboJRNcI7TeE1--
