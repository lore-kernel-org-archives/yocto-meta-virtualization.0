Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C27BE00B9C; Tue, 26 Jan 2016 07:19:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f196.google.com (mail-yk0-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05478E00B3D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 07:19:20 -0800 (PST)
Received: by mail-yk0-f196.google.com with SMTP id y10so15210896ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=wbs//XjXFUeggKcl8fURu0tckXZwRXugOvQW/aVv/dY=;
	b=SihxS5ladErEaJR684hn6ET1xnAaNQiW13M/o19oWYaiC67LEmFZCcTfdhs66k3h7Q
	Fc0bDcTDv/D1h7r0WCET2ikZPGE6bav9NCmDl6t70WcNa7Idi9Gkprpg542Gy7/JauQW
	Y95bz1nFqXoVSHtz/RZOYKEsDrZGq+SWErP7IkucH41ThLDXiQxUBagKRKsjtD6AuwAg
	WZSHooj6Rst4ccdaZLatrRANIviJyr/y/8Aj2+dWPNloQqAXVCc/tNOhQXOTN10Bj9EE
	V1afr2BvE0VQA0jN8sujOuaE24sJeOlBfDLlEwcgEO6j2IngmwNpLj4yF+rD9cAhjykG
	qHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=wbs//XjXFUeggKcl8fURu0tckXZwRXugOvQW/aVv/dY=;
	b=O+5j944CkTLia/xTKNhVhFNJ8aCJxp09nbXV7CohUKFSGupjupgF+siK1JGGlBorlF
	OwtKSfuixf2UvMJ5NBX2feKr4Ksgafotx15Ff3X9jph3fdHP9MxsHZ7cYSdmHAVKNl2R
	osI6qt7WqyanZC6J+TQdb/Sss8Bq1K94v508hZYEhl0O/83oQODPENNlmKRCE8xnDuaS
	V22+5l0oGrhzH45zFYea4IVbFqZrgZrn4aHUEjaMndQPpN3n0zIm+WWlvwOA+aRBTZUe
	y63YiNMtD4t3C+Na7uoTbTR2iQ2oeEX78kzw1S6Rm+piq0FJ54kQRi5VN37rQwsyl8GF
	CwrQ==
X-Gm-Message-State: AG10YOTcrJ0/4OEv4ev8PdPErHezglxP4sPDrvaDXYVYE4xjuYSJpZ8WkqM52S95eYePRg==
X-Received: by 10.37.39.215 with SMTP id n206mr12339558ybn.20.1453821559798;
	Tue, 26 Jan 2016 07:19:19 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	g187sm1151156ywd.51.2016.01.26.07.19.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 07:19:18 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<1453735752-966-2-git-send-email-cardoe@cardoe.com>
	<CABZSBQcLHD9Kz56ysb-xe1jHWoAH7gvQYswOXsv4gmBJBJafeA@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56A78E72.6030906@cardoe.com>
Date: Tue, 26 Jan 2016 09:19:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CABZSBQcLHD9Kz56ysb-xe1jHWoAH7gvQYswOXsv4gmBJBJafeA@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/5] xen: drop explicit DEPEND on libgcc
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
X-List-Received-Date: Tue, 26 Jan 2016 15:19:24 -0000
X-Groupsio-MsgNum: 1714
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="SEqG7OMHF66XUR0TLHO1Jfpn79l3VM08u"

--SEqG7OMHF66XUR0TLHO1Jfpn79l3VM08u
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/25/16 5:24 PM, Chris Patterson wrote:
> On Mon, Jan 25, 2016 at 10:29 AM, Doug Goldstein <cardoe@cardoe.com> wr=
ote:
>> The ELFs that get built in the 'xen-xl' package do not have a NEEDED
>> entry on libgcc. 'xen-base' is a meta package and itself should not
>> depend on a library like this. Yocto checks the NEEDED of the dynamic
>> section and automatically includes those libraries as dependencies.
>>
>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>> ---
>>  recipes-extended/xen/xen.inc | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc
>> index c63cb2c..c0acbcd 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -54,7 +54,7 @@ DEPENDS =3D " \
>>  RDEPENDS_${PN} =3D ""
>>
>>  RDEPENDS_${PN}-base =3D "\
>> -    libgcc bash perl xz \
>> +    bash perl xz \
>=20
> Makes sense to remove from the meta package, +1.
>=20
>>      ${PN}-blktap \
>>      ${PN}-console \
>>      ${PN}-libblktapctl \
>> @@ -137,8 +137,6 @@ RDEPENDS_${PN}-xendomains =3D "\
>>      ${PN}-xenstored \
>>      "
>>
>> -RDEPENDS_${PN}-xl =3D "libgcc"
>> -
>=20
> The commit that added libgcc warned some operations may not work:
>=20
> commit c93bc0c0185da21482164d9f76047715349cbb17
> Author: Philip Tricca <flihp@twobit.us>
> Date:   Thu Jan 23 03:19:33 2014 +0000
>=20
>     xen: Add libgcc as runtime dependency of xen-xl package.
>=20
>     Much of xl operates fine without libgcc but some operations complai=
n
>     that pthread_cancel won't work properly without libgcc_s.so.1
>     installed. The exact text is:
>=20
>     libgcc_s.so.1 must be installed for pthread_cancel to work
>=20
>     Signed-off-by: Philip Tricca <flihp@twobit.us>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>=20
>=20
> Given the above warning, I went ahead a did a test. I took my image
> which had libgcc-s installed anyways, moved /lib/libgcc-s.so.1 to
> /tmp, then attempted to create a VM:
>=20
> ...
> domainbuilder: detail: xc_dom_gnttab_hvm_seed: called, pfn=3D0x10f000
> libxl: error: libxl_dm.c:1854:device_model_spawn_outcome: domain 4
> device model: spawn failed (rc=3D-3)
> libxl: error: libxl_create.c:1341:domcreate_devmodel_started: device
> model did not start: -3
> libxl: error: libxl_dm.c:1964:kill_device_model: Device Model already e=
xited
>=20
> libxl: error: libxl.c:1591:libxl__destroy_domid: non-existant domain 4
> libxl: error: libxl.c:1549:domain_destroy_callback: unable to destroy
> guest with domid 4
> libxl: error: libxl.c:1476:domain_destroy_cb: destruction of domain 4 f=
ailed
> libgcc_s.so.1 must be installed for pthread_cancel to work
> Aborted
> ...
>=20
> So, I imagine that this patch is probably not wise, at least for my
> environment :)  Although, it would appear that qemu pulls libgcc into
> my image regardless.
>=20

hmm. I'd rather respin it without that change then. Interesting that the
NEEDED check doesn't pick it up as a dependency.

--=20
Doug Goldstein


--SEqG7OMHF66XUR0TLHO1Jfpn79l3VM08u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWp451XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUkkcQAJbKkRbo6IvyUA1DVGn28Qo7
z4to4l7XJ2JW3WVee6BBRLnSN+CWT4jSQH+IZnNyaShc1UFtbONRi6Sqxrrm72eB
b9FbwjlJeZfW45LXE1OvL7s6wk7+OKQSmMuuO/x7HymOvdb4Sh0C23qtjrcOPn7Q
DMY0jBuOJaZELKwqGkb7yYddABX+cyAIGC3iPo4CbvFPTPoNaRl5QzOD1kQNEMtH
OO+K2JdWpUoZAYMpeqWs4GMhkdDzbwEFwK8ztnT/QiXrxAqJfZs8YIT048rxSWLt
h7aFhz47mo2RgDo3ri+0tBsbFjaFQbMTeRFkXk1csFJJjyQ2O6+laJuiI1mx1BXX
X7kVBb2L588vCea+aL3mWJ6EIODtG5RUXvjTRscqGxdas5epDxjT47Y7mnKYuWXL
3IIwmUm9bl6APfK7pf5Qscd70NEKH8obzTpgxoti1wsJxelZPNESI9yqC9jB27V6
ScNYmf8eyWJbeIpuZh74KYpD/+J918+CeEk6W7yTNUjoRIsLuEbJmrrPl6YFejyR
r8mS28vUqOe02rBCc8k4yzNJNVwQUOLE7j0tCYxDNCDFbHzQkgQ726k3fX0oBaDN
06ardBJKuiGagQGjze/CeGwMSFCk+rct4sIFo/Cacd6rGRlBE6I/m0BpFnGXqRUJ
zwzbUl1ke8sRrc+Ov5iA
=dxW0
-----END PGP SIGNATURE-----

--SEqG7OMHF66XUR0TLHO1Jfpn79l3VM08u--
