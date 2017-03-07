Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AABDE0050B; Mon,  6 Mar 2017 16:20:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 179F8E00985
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Mar 2017 16:20:10 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id p77so5156895ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Mar 2017 16:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=a6WM8G4eQ90V/GiYuom3tgCAVEWR+duhciu1+8RRnvU=;
	b=LGsxsOmMbXk5ONYXhCQEN9epd1nT4W/BDImFqjO0F6jZPl26aJCW+OUCvdUF8q49OV
	kG3Vyhcafk0HQjJevqXon6umDYwq7uzvcLCbJZ+03OT8AnSV3Elxqc522d62Tak3149S
	sRja2xgY8mmO6voAir3401R99M5rDZr5XcPE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=a6WM8G4eQ90V/GiYuom3tgCAVEWR+duhciu1+8RRnvU=;
	b=jpt9peZpXeguoroUnpeh4fVkDoPSV/9SLnNqZH5nyLA0SPlRFHzU423yumYv+BVWvI
	lAvKpao+9em8mn99sMabcl+44W49TI0BFAEO+goDiC2hCT2Dn0oVYlK69FXeQfJlyESq
	9OO7OJw6MfvDTB27V+ljNIWuug0KK97k7dnEPxMSbQ+KjzypkuGTZrp21BH9sajkqQ5c
	iUd9Z9bbAGZzTWE4NXCoIkED2dHfDr+aFy3cntJsVCfy75pNQrZV/sfOdVQGxy27K5u0
	MWVC99hs1Ux2BpCzFeHKOjye6cJyUligLJKOGjKudpbN0zy4yc5h9vnxNqDxkVTuKcv+
	ALpQ==
X-Gm-Message-State: AMke39lxJ5Y/JG42EOlqR1JF5PIB/QxrIR+0w70DoB0A5hT+6eXytj3keD4tPdSjnevQow==
X-Received: by 10.129.183.18 with SMTP id v18mr12867813ywh.217.1488846010143; 
	Mon, 06 Mar 2017 16:20:10 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	y144sm8429273ywa.46.2017.03.06.16.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 16:20:09 -0800 (PST)
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
	meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
	meta-virtualization@yoctoproject.org
References: <CAFL6qn7tXPcm-cSjtGsPFPZcqQWhPVyJkJZOnQO3c+ut7g5Gcw@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <038d9c8c-28be-3bd2-018f-9c8ac5b57269@cardoe.com>
Date: Mon, 6 Mar 2017 18:20:08 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFL6qn7tXPcm-cSjtGsPFPZcqQWhPVyJkJZOnQO3c+ut7g5Gcw@mail.gmail.com>
Subject: Re: Building xen image on yocto
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
X-List-Received-Date: Tue, 07 Mar 2017 00:20:12 -0000
X-Groupsio-MsgNum: 2461
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="UWqagg7JghStWJW5fbJWqOmjwGinCnfFr"

--UWqagg7JghStWJW5fbJWqOmjwGinCnfFr
Content-Type: multipart/mixed; boundary="p6Ri40GimPeT3HtrD7piQ6xWr55Xschre";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
 meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
 meta-virtualization@yoctoproject.org
Message-ID: <038d9c8c-28be-3bd2-018f-9c8ac5b57269@cardoe.com>
Subject: Re: [meta-virtualization] Building xen image on yocto
References: <CAFL6qn7tXPcm-cSjtGsPFPZcqQWhPVyJkJZOnQO3c+ut7g5Gcw@mail.gmail.com>
In-Reply-To: <CAFL6qn7tXPcm-cSjtGsPFPZcqQWhPVyJkJZOnQO3c+ut7g5Gcw@mail.gmail.com>

--p6Ri40GimPeT3HtrD7piQ6xWr55Xschre
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/6/17 3:28 AM, Pello Heriz wrote:
> Hi all,
>=20
> is it necessary to add meta-petalinux layer to build a xen image for
> zcu102 board using Yocto?
>=20
> I have read this information in the next link:=20
> http://www.wiki.xilinx.com/Xen+Hypervisor+through+Yocto+Flow
>=20
> The think is that if I include this layer to my project, when I try
> bitbake, I get the next result:
>=20
> Txertatutako irudia 1
>=20
> What I have to do in order to solve the issue?
>=20
> Thanks,
> Pello
>=20
> =20
>=20
>=20

I wouldn't use meta-petalinux for the target you are trying to build
for. I am fairly certain that patches for the zcu102 with Xen have not
been upstreamed into meta-virtualization. Patches are certainly welcome
(as is hardware that I can test with).

--=20
Doug Goldstein


--p6Ri40GimPeT3HtrD7piQ6xWr55Xschre--

--UWqagg7JghStWJW5fbJWqOmjwGinCnfFr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYvfy4XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvULpIQAJF9T2rj6HJZm2d5OFKHZkmV
p7Z9lDcCMn3gFvT2LzFTjZGD/Xwppfq/sDVNyzAzTB0gx+2P/66sTrZraGNlaPAT
NIqjxLkWlSZzmstAPG52/cT+46pWI6lbLrrj9lnfxGMlSTaVz1BKHL9ggTVTbtmJ
9qjYxc0FYPafLpAapW6doHuUxlGaRvJ57bb14BYptU2T0VQrhinpQ6Bj3z1RgqtV
yrX3uJdy/eAuXilzo2dqyuwI/yDkStVSv8ec42ph06Ciy+Igt9fhTKjpH/SW9m6R
0chnclej6NTsgFCHPk51WtpnFZ6FJrx6yDhAgtPg71oPHhQ1SPHqwNHrbJsyaJ0S
hv3xc1+eP7FzhHIpwH2huGP3JyaelYAWbKSe8u64oyhnvsdFFo4Z6Vdk7bnK1AW5
iLtgqNdBo6oZNSbIgNf6EDO/g9D4fwFfcgnnbjg5PHbuZKQ8x/DlIpN03crk4LOS
bHoCB0cJj8iVTD7pSiFroWK4Y5B/6rDl+svUKjuKpwset6+q/zxJ/0ZzH6jYIFs8
lrnvp5A+0TY/RNyYy9DQR2CLw67sIRaPf/VMCn5ftiRC3CYXM8JjoLj9Wt+mFXeE
GW6v2Llk5/ces1m87NOIn0qWkUGgr49eQynaGzvOWl9kEdESgLI9Ahxe25Ar0KqV
Y+Y/KcBcUKsoe9FSwZAH
=hEyX
-----END PGP SIGNATURE-----

--UWqagg7JghStWJW5fbJWqOmjwGinCnfFr--
