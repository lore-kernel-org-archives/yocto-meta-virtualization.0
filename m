Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3161E00948; Fri, 22 Jan 2016 17:09:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F6B0E007F2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jan 2016 17:09:42 -0800 (PST)
Received: by mail-qg0-f45.google.com with SMTP id e32so71274623qgf.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jan 2016 17:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=BX9MswNIZ6tdZqDclL8oIExzpCi382JpL/fS7xyuzkI=;
	b=eYw3A5Iwe8L8/1vqIElrTXJHB38P7LvViOwxXnL5ZpFcrfNKdKf6uhULMDaosqxBek
	AXxX5qG6/28tsefccVYzcgTh8oVabCyFvF1rVy5SJtp3F/rfc9E2intQnyDsz05sP5DE
	L/ekZweBxPFWW4D6IvTicoawC+LUNSPgCvZfqLk33H4IWmz+uogLoleqxDDoBgf9rL+r
	uvMY6FCHFwk+1C7T/A9E5cHv74NAdQ+r56I4BATJDzka2w2Qp36QHlXRzVut02uTVy06
	NlYRl4GWMgnGBEIfDstsusEr1jFDYCKzJgmACKe/WjmCSGMRyURZ8wLMRRY3Cy137+du
	e1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=BX9MswNIZ6tdZqDclL8oIExzpCi382JpL/fS7xyuzkI=;
	b=atyEiPXRh5TaeSGq7shidLt6CSXYYWY/0XMLd2thSMsI+gW2ek5x+cnOVsnYVijYZL
	jWjSf30rTrBgqNvhibdPDeDgcwoATxPFrGMVdHyK/uKp93L3glWh3ZYTXRZ8d1aw6kAU
	iguEdRdo2WtvN+bAo/99bLvGOz/D78VMu+7FWWnAnYg6IZEPe9U8yKBu4mzAb1DUcamK
	X2mW9jbiywq1P/e8KibKWh7eobgclDGv8xuNOunqtAGhM+mpYiLCRrR0mkkvswxJdzUB
	mip8u9FSi690aUXuH+k+V/H29qKR9u9eEF+pTAYGEjAQtlkTI4REJpgRR/AlSaZBqT0F
	RZUg==
X-Gm-Message-State: AG10YOTcq9Rgekf9GBgXF1DBOF2ekUelSrxgviKTqghfHHXPmeekldI0WSzJ4dalCWJCtQ==
X-Received: by 10.140.101.119 with SMTP id t110mr7556430qge.68.1453511382375; 
	Fri, 22 Jan 2016 17:09:42 -0800 (PST)
Received: from doug-macbook.local ([2601:7c0:c300:dad6:11f4:8bdf:525d:a055])
	by smtp.googlemail.com with ESMTPSA id
	31sm3933475qgz.8.2016.01.22.17.09.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jan 2016 17:09:40 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>,
	"McGillion, Brian" <brian.mcgillion@intel.com>
References: <CADqm_SRdKySYQwvUMepd3uVvYzLW+Qd6tc77k616h3BiTe5-NQ@mail.gmail.com>
	<CABZSBQe3AnzvwfW-x4Fum_AoHYn2OO1VD=YEmmRkNhJmZGOcSA@mail.gmail.com>
	<CADqm_SSvTkVDrHku6a_MZww-KaeQ+SamzgNvXSZ2tUd_RbJ0LQ@mail.gmail.com>
	<CABZSBQeNbXniYMV4PAHrc=MuRMMiNorfbuczmVLjaE3yEnKJuA@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56A2D2D0.7060900@cardoe.com>
Date: Fri, 22 Jan 2016 19:09:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CABZSBQeNbXniYMV4PAHrc=MuRMMiNorfbuczmVLjaE3yEnKJuA@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Failure to build xen-image-minimal
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
X-List-Received-Date: Sat, 23 Jan 2016 01:09:48 -0000
X-Groupsio-MsgNum: 1701
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="ANesMXB9ITO8teV8LKMDN9eaf0lMRXRCO"

--ANesMXB9ITO8teV8LKMDN9eaf0lMRXRCO
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/21/16 10:05 AM, Chris Patterson wrote:
> On Thu, Jan 21, 2016 at 10:05 AM, McGillion, Brian
> <brian.mcgillion@intel.com> wrote:
>> Hi Chris,
>>
>> Thank you, that was it!
>>
>> In general should that config not be part of the xen-minimal-image rec=
ipe?
>>
>=20
> The DISTRO_FEATURES is more of a "global" variable and the scope of
> xen-minimal-image is not sufficient to get what you need (in this
> case, affect linux-yocto).
>=20
> Perhaps we should document in the README?
>=20

I was thinking we can do something like...

do_check_xen_state() {
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no',
d)}" =3D "no" ]; then
        die "DISTRO_FEATURES does not contain 'xen'"
    fi
}

addtask check_xen_state before do_rootfs

I can submit a patch.

--=20
Doug Goldstein


--ANesMXB9ITO8teV8LKMDN9eaf0lMRXRCO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWotLTXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUZXoP/0tW4WxaSg6gFwgf1x4PbcQ9
MAmidILBqQn/zH9SiLq9BaE3Ig1IsUZdhs+96Un5qZpBGjxZ/1+HfYS+GIVYBPKK
2VWREkKAT8FQspqNN0U0PeOINQv65ksxUPKTKLjnF169b4Ws3u3QelU9tzpzpiF6
fUNtQqEfNifaTTTEtSTgAHKeRap6FPegFece9VcOJs9L/Y8o7T0rdR22wOmFh1ku
2ogo+A+176JJPvjZzSgvsLVILhoOrpabFoVQ473QDrbJ54u8BEabZ+mcxoQZFlWQ
JRDwECWaZ5wPAWa1KvwSAjCQKw9lmbObvvwum5ebGQMFIqAPqdCdRr6Vm2MBZdDk
maKprKDqpgu1z2nozfMFq409Jy72kRC7hemXP6K7maAM2wi2xWNKXTjJQhiDH9nG
CKg99H6wGnPavCNmQmNkrWSTK+gAyNRHRECo0KofD4ijkkDvLXYi56QTkGnmcfP7
n9IkOWf73stNOj0AHDaZx1eNdyTdSqG1gt9+G47jbDEXVF/2ST+pjkiuEXrU1dwU
jqsfQBiM0fp+HJlyLwDbIyOjtt0I4UP5uDQI7j8f5nT+nPX8gNnJcZWACLSSdTix
zHSXIcPUFHsXhbhvpkOUeiHwBKOiqkhFx14GNKD6AZMQRBg7pfiX7xeRwX0qZ0SV
pBXOfFjOnisS6TPdOHr/
=t5gz
-----END PGP SIGNATURE-----

--ANesMXB9ITO8teV8LKMDN9eaf0lMRXRCO--
