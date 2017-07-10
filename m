Return-Path: <jeffrey.pautler@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E516E00BC2; Mon, 10 Jul 2017 08:02:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [148.163.158.57 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC932E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:02:30 -0700 (PDT)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6AF0wNo007581 for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 10:02:30 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0022.outbound.protection.outlook.com [207.46.163.22])
	by mx0b-00010702.pphosted.com with ESMTP id 2bm34uhab8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 10:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=K4voSr2o8paNExN/1RjFoyYilSVVzAvQm7hNvhCz1Uc=;
	b=lyX+Jinig1bXAl/JzVkyGNhZabX5WKGrcdbIeK8eWv/ErkmixdZHqfPaG0mnjQy5goVQ1A/uUYeqKiS+p2/TCr/2mZ1niJ7Q320NqMYuqzFWNryPj335m2/RZuehgZKgXdFwsW8XPXQJ6+jYQDMwUhgT0FZWdQPI7PAQOWliqPc=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
	header.d=none; yoctoproject.org;
	dmarc=none action=none header.from=ni.com; 
Received: from jeff-ubuntu16-vbox.amer.corp.natinst.com (130.164.62.206) by
	BN3PR0401MB1282.namprd04.prod.outlook.com (10.160.157.155) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13;
	Mon, 10 Jul 2017 15:02:28 +0000
From: Jeffrey Pautler <jeffrey.pautler@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 10 Jul 2017 10:02:19 -0500
Message-Id: <1499698939-31739-1-git-send-email-jeffrey.pautler@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [130.164.62.206]
X-ClientProxiedBy: DM5PR16CA0037.namprd16.prod.outlook.com (10.172.42.151) To
	BN3PR0401MB1282.namprd04.prod.outlook.com (10.160.157.155)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ca38879-9fab-451b-a5f0-08d4c7a4ae8c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN3PR0401MB1282; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0401MB1282;
	3:JehdwmmZiMH3YSSVgyA49oEEb0st1q1Ules57wpLTIKp53gk0aj47n4rZUZHoa1enVLXAgR2p3Ka8T7gkf0HsAGg6W3IWf92zAH7hFoAs9ZErTyRC2cMMRnLo8iPBOY4TYCo3uTrLSfhkOYaA5p7IqBWPl59OpCG/m0m5+1Zn43hdK9spsqtGcXRvMOmGwPmKtluIcHlIjD3SZNg+1pmm6yngEclspcYvhGABU+s6BvL5awbttr99+xskwmwEGI/XjsjAoI2p3KVDkmK1CfBrUhsv59TSnz1wEzTYT76MH5YwJST37e69DXIUwYpMXBRHGtUvQoL9/j6nCQzrxHKbO24aVAajRVTV6VuiGM6EUqW/ErUMcyuo6M4DKH4/ttUrSMK88aJCISPrycC+pw1GrZ32GSmzd31LesyZidU/GIZ4jZEEoAEkdpno9blBoNmSIHj1R7CnxoMALtE0YvY6Y/+SHkRfav9YvjvrZTvVvzYgtu/V94n6cBuqef6KKzn/iTKc1ZqBSZXSJGAbnsF5zL/hnlelHAm9Gq3m3eQBTfooChPae/dpTJAh+4x4TfTIl1684FRxyY3R75g+pUSXab4Hwb6ySFZyJf/2SBAgeo1QcXBBDDHVMyhQk/aHRV2sZIMpouFFHniWNNPS84ekCKnnjIxnepyzgjgHZomFyLNx6u/XTLzFywR9ovEw0wmeawHRT5B1J/5MEW3RK1Iw6rm2768Fp0HvgL4jv/40p0=
X-MS-TrafficTypeDiagnostic: BN3PR0401MB1282:
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0401MB1282;
	25:DyqYnqPmkuvS31L7/d7dLFFgGLqtqEqCBDYV5jni41kuobSkbixmBU5oSjhTH4EcZAuryGyt9d4tGEfZIBRNj+go19HetdAFM5dIYCSv0ZAsbLbBZcM4UNvQhpqbu0brEk5mBQZR96mMtDUzTJzaggh/QO1He74Pw3HaGR6Sqkidvrn9/6B+RkdPRNLMUXR8Ey7HPBGhC7DFfVNsT/PxcA69E8vQWIcanwby6TEX4ngl2g/H167BrmfvsSXnZHjAR4YdT00csKL2L4OqiBj80he9HkX9TWYuEGS7/V5f/DYbVo5iAscYDboBFgcQatyNvpdwJ3HGHc7M+OgA+LzE2bZbQyJETdGrOHpnyMy5ku1mWY0wJC3cgrLFEUIdJ/lYRnk9NqXO4BXZCHI2hAb6gA+UX9yZK9GpuAhZ9AnSVmvePyqCqitxUhFhqjeGYdHR+C7y4nIMGo5HtekfB0LhNtTRmT3W4l2Np57rhWkcv4de6JZqqlpA832USOlyjOU7Ga9Q/opCIaNlI1uX5TmakRYulXt5iM1v24d7UV3zQrN6A44/1hjI+4qcZtl4hmq8yJxPVYD/CKcs7g/KwpCD1qHqaoWpcmYmM0LS5w3FOz4S44sMSWcWUwnjJlgls2E5dlpwBaQCpEwxVu+vIt3GHcgG8Ye0hR84+sUb0aYzfXHMuk1hziTwhF+v4mb+EjYk1RFOCzWeVIA3fynOKQxHF8/dlejiBv9jKYHztMsNAxU2qBP6xugdJ9lgor7fPS83dMp989Lw29kk2oEBzLtyBzhekWLe/7bJiyMGSNXYzwGt4tp9xCio0S2eDcmysjyCpmmHh5/Ls0ELaw/km+ayp2czulo6CjcD8vEb2rB3Ru+LNjUwWkeU4HIWWztcUgKRZtaTXaZ5+Bh9Zk4E4T96nnOGdnN2IYD+oCpwwAVB/eE=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0401MB1282;
	31:UCgLINWqRM7EHNeuIn0XToE6eMuUux+AzMmDddDfjpRjeUDa4ACwAb9iZXS4mOqZBL/AVFbLQLFX6lljf8BGLWNJF15mebRKITO0kM7Gel8saNDdoeX53zLlqRhI3pip7VVOqXJ6yhQqgK3ZCGqVij6vIoy1Xpi3Lu4Ye+4UeRok8HUKqFKGPAwIIALQJGhCSzuecKxV1WEmG5xAeskJb6rt9Uqnnnunou6XHLYfMkVUf4ADdB5ItQhM0C1pOjdD5R9qBOzxajvgLAcrh/Q4iAeWoloStp1OWAMMdKSoz4I2impqxpCoRGiX8m4qFJB7tfRgFgPfJPYESIGoLQJpJQCt4K9YDvGrEw1VAzSO67XFu9O7uuga9pwOut8vgO7rC9V0rqKQCpx/ocTk+YR+C/eHj4VLO0H6d8EQR9PEvxOqA9lmoyHiSYvCIm1sjLDwcspmuVxXGp+UuxS3uyRUOmwktNg496jp39mJuYi1nAx5JkW7ie0QDk+8zGYJzVR52vzGokHpm4RPtrARxxvp4CmOnme3Q2Z8rqHrcLSrXXi41vzI/WoZNXu4tRJje9qI8LCw8CbHwxQJ3eJdjPBHVo/NdxHhDBvIt37aeNKO8AvP2N+tf8nVKoRD1T/3atzAICsqdLnYL394ICEhzNRg2Ddutvq1OWccXxSib9jtc8k=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0401MB1282;
	20:EruFfrwntwx2sIiBLFvyIfcX2nFR33P5SKs0jeaLc1j1N6/kECEpkhVUFJ1IZmliXZ+qkIZtbRst48Cm0tnBN2c8D5o4F0ufgntAbZvtfhbJlMJWmblYN6L2P62ciOScZvbyNFr3F65RqTlrx2x99lUeTDkhPl5OhQzV3B/W+rsEKT5fJW3bCHP/DTjg4HT+Jj6AXZJdK6wyPdCqtChXLUWa7Ih28NXHMcXxGc22/K9IyRcTzGmd1GAi4Xg5mKog/PC/mpbaXoIhu6wY136om/RFvd/DSms5BohlPdRZ/xd1N38CwyplRB/7WRU2JsotnZlgDi9CIIv7K7oXmHvjsZuFcefMiGTHXka7I0nWZsUPUJrCT6TjitvvYZlOE5hTeFRAAIfM0cBwggvpEnDiLPVqv0cW/Jij2UG7B0x2DD12031qttIWSljABBMmrR2zx5Ic2i3prTrIYLgk01BdZWEMFCoMaMfUfaKbjySG9GCr0NtWaegUzBMPQ73upafVYaLVd4loOemdAahN2seijmd9GEAJNiT0KQo7RVGOuCTVLPf1NodZ5Aii31sqT9ok8MWAqBE9Pi5tAUv6JtrVHkNvVWZ5Qj5WTO73Hnh8+PU=
X-Microsoft-Antispam-PRVS: <BN3PR0401MB12826C20282741C442050B6396A90@BN3PR0401MB1282.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(148574349560750)(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6041248)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN3PR0401MB1282; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN3PR0401MB1282; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0401MB1282;
	4:xnoidNrYbwQMkvxqe8hrcfojX5I1Et9EncJvPy9r?=
	=?us-ascii?Q?fyRWUdbsEDX46KYmTvxzMPELluemeGGfxzROhLvD0gX9ZJjcTRo4nM8BuEGc?=
	=?us-ascii?Q?aBD53lV3GhUNDCkGywaIn50YRuQoThyUizL/4OSmMtQ+/Vxqe2Pi/QO1CNPK?=
	=?us-ascii?Q?WeiQ8OZOA7t+8rZd6VCgZDk4WA1SX1ut/IcuYlE1J0ndNUFWlA3HDAIOX++b?=
	=?us-ascii?Q?eWt5ox4Ykh8umhImyVXodOl0CcUH+c3+/UU8oTdJdOpPv0Ktve4PmVjB5eXl?=
	=?us-ascii?Q?Bga7SUZaB1O6fow91pVil4olvlXk9UrCy6mbLSBREfiLwtDchlRbH5ZfpRt9?=
	=?us-ascii?Q?7+r81Pd5upy7KN/PUwVkatjgS/oD+oKSYWbkQUCxLjVmgYU2zNgAGcXQe69S?=
	=?us-ascii?Q?7iiVLR2I3ZrDTFEUrzgCl34FLcnlWE9pqw6tNQwBANpTSOgitvErivHuNOwk?=
	=?us-ascii?Q?m9grc96IHVHAMcR+rJ8BEvEQiXVzhuGj+wwy0zRed7c9fJ4fOKQyVRmd/LP2?=
	=?us-ascii?Q?9kLIIoGpQXG7tTeYCCQjPuFC7G+I2En//P1nYLPUpRrysonk2Bm2rIeSzTRc?=
	=?us-ascii?Q?GZzaN584f+qrrZdxJ+WCpHEj1B37rEnRZgyY9TkmgxsK48jJxA3LJzt3kLL9?=
	=?us-ascii?Q?6yLVUOc0h8EY4BIedCTrZ9AVQd92OH+C2v9x0aP0vnlxlrl6huJdxgt6e1vB?=
	=?us-ascii?Q?GkbVU4hSsmhHMS6LteE2JOslzzODOuGU6yQoROlU3gix2oh37iGuBPv4RWV3?=
	=?us-ascii?Q?kGRzXf4RV39sg13p28Go89jYU47rL3lKFfTdsLdpn4/BDY1MI1Xu8KhXEopp?=
	=?us-ascii?Q?HcP3nPZFnJJzsEN3OGvfw2Iq6SfLe1F2cD7EZS+Q89vzCCc7ZveqqPGCYiks?=
	=?us-ascii?Q?XkFT2DKatltJA5aOMQ57jleqfkc0Q1lFrhpbIkhqI4LOUUW4fTJNO51z2XM5?=
	=?us-ascii?Q?dtKTYKuRcQLRmSMsj9cjkXntq5bGXA8sL6ef+qTH2AiP6TUckvE3rykFSqid?=
	=?us-ascii?Q?UI/OgOf+y3fFH5qvqzzp7pd8lXdcZFvzvIdsoYulKxun1CG8VM5ZvjFuyB53?=
	=?us-ascii?Q?s0/wwOd1xbYf+bDhNVbL1yMUjCUqQGhrHb6c3MNezGJ385KXccJdjLMj5Qvq?=
	=?us-ascii?Q?WPmaKGcctn4d5fkjmwdSl1/WvyIZBi4mXKDn9q0anjO0RIkd/CBc/Ym/vppK?=
	=?us-ascii?Q?ZDLZAEISV1n3rUDtyk9PrxZs56LIY79kgOVfsyiIAyJFWc/jEO1EUjjcqyyI?=
	=?us-ascii?Q?0DfVL2hR7CFvufWi58A=3D?=
X-Forefront-PRVS: 03648EFF89
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(39850400002)(39410400002)(39840400002)(39450400003)(39400400002)(42186005)(66066001)(47776003)(2351001)(6506006)(81166006)(8676002)(5660300001)(230783001)(33646002)(53546010)(2361001)(25786009)(189998001)(7350300001)(5003940100001)(50466002)(6116002)(50226002)(53936002)(110136004)(6916009)(38730400002)(4326008)(50986999)(6666003)(36756003)(2906002)(48376002)(6512007)(3846002)(305945005)(575784001)(6486002)(478600001)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0401MB1282;
	H:jeff-ubuntu16-vbox.amer.corp.natinst.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0401MB1282;
	23:y5qtQJIiKDKMaVV4k+LEfLmwUZlDyFCp8RCXnvD?=
	=?us-ascii?Q?zWt36MBV8djM2FqHVtUCN0atz1Kud0nsrhO/PHF0VIntCGwHVqNXt+IDgrJM?=
	=?us-ascii?Q?4xViXVCo6mXhBQ1e4DOPSexpdJXM/CQhiU9TXh8VExty5QdcqMaNiwRYTFvB?=
	=?us-ascii?Q?nVAFmKqMmHuaVyfr8wriaKx9t4qb5jwznLqVU36gv22S+0UMsKldNLruD2/5?=
	=?us-ascii?Q?+LG+g2HC1Fb2lzdTVvieVF3EpW0QFyPMdIKTbslu3jAVGOyhAhlrFv4vy5sT?=
	=?us-ascii?Q?t9AR0SQtsgvmzlBqPZuK6zMPc366V7Psrk5Ymev+FhYklmZ4Mb2zli0oNdUe?=
	=?us-ascii?Q?Rex9pW6VaT7YuR0BSS7Ukpaht9ZhKiw6scNbEucgwsUwVjQbkhNAmDgMPXqg?=
	=?us-ascii?Q?VeLr/hWaCKj9ZM6zCU/q121gIimRciRmI/ZS+Gd8XfnmCmfv9Bwka1CkHJte?=
	=?us-ascii?Q?wa5WjOm8x1jSkJ9ESxyMGpAx3ED6AwJG1M23bxzaqagHcuUzlt8loGrjKw6x?=
	=?us-ascii?Q?TuIOhnaqduGVd9EHvAzaR5NK2zV6ouJW5Tm7ASboTEs9h0CLBa8Kiodc/YbR?=
	=?us-ascii?Q?g9SotbYQ1N+F8Cz/6cUmFG6zF6UPXPiEzv91AMjxZV3KaCuUu7otoqlK/9sr?=
	=?us-ascii?Q?RgUvNqgctKuL4U1LHhZY2ZoubbWmBKwiJEVIK0zQTZ1guUfaVXWixT37qoDS?=
	=?us-ascii?Q?MEff1Hqg7Le8/quireSeeEYDyok5sNPbnXtKBLKh9Q7bjpAvKJ0PVerrjktW?=
	=?us-ascii?Q?3k+f9+iFfrhuNctXEOkXngMlPjvDzOxG83+CmD5/sLJCPRUi0uMobuT9ojS2?=
	=?us-ascii?Q?/QY1TFlOIGyKSj//1oM/1ZCWJgJhoGuz3d36ZORzWz5oPdhu93T+sCuE7xGF?=
	=?us-ascii?Q?8+7sUyz/z1cwXIPD+NCvMW/594GdZSwo67JlhviXzKtanDLo+vKxotZa6/kN?=
	=?us-ascii?Q?+lKQwGAq04xwf+d/HsRNHoUzS3VFH73jN+xVIFw+53pGUGHf3RtpOoQdSy6Q?=
	=?us-ascii?Q?poJfuW9z1I8TdoTUVGYCnhzf+diTqRr8o4nC7WFu10G22SCq9MdonZ3eX7sG?=
	=?us-ascii?Q?LSHl7mcLh9dpKKnZY96w8WAK5E/c6jl/AjDA0sMONOcMQX36u8cz1TyMgV0U?=
	=?us-ascii?Q?gHvdFHF2wxSY=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0401MB1282;
	6:rQs30aQ273NkGCH8y2ZAXy2sSrmcz5UMkru/gZ7M?=
	=?us-ascii?Q?1KqEMBObzPuT0mbJ7lLlW6OMDjNtbOd5F31oKDe9vclArGHMMUxIpaQt7Jc0?=
	=?us-ascii?Q?kHwzpiZDLLE3CIQlNm3+abpzaPbeXjwQnoFvzS2mIokvBqBua5y23Hl4BYWr?=
	=?us-ascii?Q?DxTT5VAN9RQmzExG4Q6UszoJkLQ8O/yCoi8vsGYAffBydkdvMEEQPWhjrCkQ?=
	=?us-ascii?Q?UqrZOCmR4KqWF385aKQKGckJeoJbILqd84GK3P46ZkPcP6NL3OJ12xfpFFz/?=
	=?us-ascii?Q?uZ3HUGhbFQC9A5SsIxxhiRa8sYyqdgUQagyZi0fTLc1+6oijVwS2PafPbQj3?=
	=?us-ascii?Q?PqkZhhC8tFzlymUrD1Fs6l8LHENqm6QDnCS3hT7rSVhKkLamaMeMJrYlbkYh?=
	=?us-ascii?Q?Qa2+oPiM8i60zUfuCUrxFvB3zfzQxtKpHUxRTRTGTjLPUPPAufFHux4LuzKN?=
	=?us-ascii?Q?eBgvoynRSVy8OOeMyvtPrSq2y+HUBZG6VuWrnCJ6PCJjLYRY3vr0aNgx7QWQ?=
	=?us-ascii?Q?o6oJdhOrmDFLHYoxvafNU0a9kWkVCYbBpEWTEe4+12y50S9QwoU0SuSfTocK?=
	=?us-ascii?Q?6V/Zfbjxzf/Nw8Q2k5VDUteOTG958gebd6yC99aIZnWQlbzP5Qp40RyMu+w9?=
	=?us-ascii?Q?/ArxmTZVYqVuDZlTivwpChCPzpGCkM8szjq/2U5Ez07GWpWrJgQpRuMdymRA?=
	=?us-ascii?Q?6ZRa237jSIIECTILHusD6+RZldWAqZJYD/rb6OqpmShR7aJMJh1nPEP/a5XE?=
	=?us-ascii?Q?uUFDC5HmFGZk4fV/qrXT5MwPhY1PB0uIkoXfhiL3/+ouj19peJZ/gRAV4gNV?=
	=?us-ascii?Q?Bk/9/xU5+PC8LRhtE0RqcVnALreRW07pamfdYOztjPEuhGqjKl6bB0pZRF+g?=
	=?us-ascii?Q?ivfMzX8F2Rs0qLyJomhKCRWYAx1h3cxLPetjGoFZn7+Trp5V2iPypGiJv1wx?=
	=?us-ascii?Q?0wiEAbzG45z+BQj9lfh5VzegSxKhobH2y2jB0qEfeM3rPSO5cjoaigDvw8kz?=
	=?us-ascii?Q?XE4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0401MB1282;
	5:wlMrD9pVTKCUZ+8zH2+38is26ZDwIVYG5QZLWsmXPFG0Ikd0XKWylZW5bY0raWaodNLB8zxuxbtSC0rcpdMuNjuY+FDhFUYPLstCTPWVOVxI50B7Ych+gM2N8GWZLZYwQo9auuDvhERALc5TMR/PoGcix+L3OS5wr1TtOTQdBK4pQHJJSI750KQ9R6hThstUSWCL8jvQP8s5KYxQT1EmFlsSN+hgJbKI05rN0RK9ONaAUeZV+GJC6s+7pICptuj6yjqyiqUgUT/axFJzRzt1e8sw2sHGiwjV3jOfyxWaQS/7aZA6Ny3wmVh0l8GiAtb59kA8jpFm0sewwgb5F+j9C9fjZEBQWn7sDaZDaGAsanckSikHS89vmHnpUjntXFd70s0zsUd8JPM7p/nltZEipiUW8rf6tLV1plbuAv12Ob58RAFEdPl8VH+2+qxONw1PIbSQXSvPKmxoYHdfdX8gveuPwNsh7DCJeWdSjyBrgmVjzsiN8lhyBkAroi2kgIXw;
	24:U9k0L4JUCLS/XEFsrgNjeDupqlxxozPeeezZM20jqpZilknjzrtIhd0oiuT1qExKqJk/kBEWNlCGI+wpsILvq4ke4vsPlUzXHH/rXC1JSis=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0401MB1282;
	7:FSgmtTY0+0iQySOZ/a+HzhKqkAf5ACRKMW6MK5skbaqRwec8S0jQZ5/B7qG56jrpj/z7/VQwiSUIv3zbupHR2ZpR+e6GTV2P2MVCgA49fNf85eLbnNgoY+dOjNZoQjgR1IJY7RchEBjUshlqvii+YvbDAk8/LMYWLu8cRCqSSA6fAyBwEVTUv2j/IDRbla6O4PzxzUeQF2XcsDeoxmIUb/yYtfxAEF5ZVhhPFaNjR7Yw1452e8BQ7lYJss8du0WN0gnqHNUXh8VPAYCi9bo4cJKDWFUBXeDcvI4Ted38XsRhW/HGN0A+ssz0XIj9fpPmI3+26YD+LzJt1L7NOg1hjkm3AhcYLtuyvvnFInTP5RlBVfaH5QKlry95kxN8j2UYQqbk6+ayqg7TxEh7JdbEymBxyFRFt+fR/ECWOheWEqNX35oEY2uBN1B2k0h6xH4GIBX0JEPlmqpP6R3b+Z/erlFxbDShKN1eBK2LkqLVJfcIfa8fIY548G5G3KQFCiSn8CEt3WNZhgs+p926FlZhNdBO25LEhe4++XY17hovVwihEORAmtDjXQ+4i0I2j5ouYC9PuQrGcUGjWCjDvXbjR+hl/L0bfgcgHGX3gYf+duDQ3xhZd8RT305EMoDXGNRt/gVkBj6fvVaqHAK4Ar3/KgIrnyV0PhzP96v4NtuAH61BFFfeAL1y3Bi9uygoNau7ji9BfBhZ64EHQ2618WvK3xRsUeeeRQkmxEU00myw2hwJDhBrHBgWSK9huKknjbEll2Op3erl7PrgCqAPG2p0O6XI88Op2L2tA8MUaUyFcY4=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2017 15:02:28.0787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0401MB1282
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1707100268
Subject: [meta-cloud-services][PATCH] python-salttesting: Modify patch to improve ptest output
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
X-List-Received-Date: Mon, 10 Jul 2017 15:02:32 -0000
Content-Type: text/plain

Current test case output includes shortDescription and looks like this:
PASS: [CPU:24.1%|MEM:17.4%] First line of test case doc string

New test case output replaces shortDescription with test name and looks
like this:
PASS: test_case_function_name

Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
---
 .../0001-Add-ptest-output-option-to-test-suite.patch  | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
index c297320..e86768a 100644
--- a/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
+++ b/meta-openstack/recipes-devtools/python/python-salttesting/0001-Add-ptest-output-option-to-test-suite.patch
@@ -1,4 +1,4 @@
-From 7e2642530bfd4ac0226b90404e7a4511e44756b6 Mon Sep 17 00:00:00 2001
+From 1950b943b7173198f345a1cff7b7f771cbac2244 Mon Sep 17 00:00:00 2001
 From: Collin Richards <collin.richards@ni.com>
 Date: Tue, 28 Jun 2016 16:02:22 -0500
 Subject: [PATCH] Add ptest output option to test suite
@@ -12,12 +12,12 @@ Signed-off-by: Collin Richards <collin.richards@ni.com>
 Natinst-ReviewBoard-ID: 143279
 ---
  salttesting/parser/__init__.py |  12 +++
- salttesting/ptest.py           | 168 +++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 180 insertions(+)
+ salttesting/ptest.py           | 165 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 177 insertions(+)
  create mode 100644 salttesting/ptest.py
 
 diff --git a/salttesting/parser/__init__.py b/salttesting/parser/__init__.py
-index 1e7275b4b65ef29deb89049a70bf6a074e11873d..d8cba0cb1e4814b7065b6896186c25300048ec92 100644
+index 1e7275b..d8cba0c 100644
 --- a/salttesting/parser/__init__.py
 +++ b/salttesting/parser/__init__.py
 @@ -25,6 +25,7 @@ from functools import partial
@@ -55,10 +55,10 @@ index 1e7275b4b65ef29deb89049a70bf6a074e11873d..d8cba0cb1e4814b7065b6896186c2530
                  stream=sys.stdout,
 diff --git a/salttesting/ptest.py b/salttesting/ptest.py
 new file mode 100644
-index 0000000000000000000000000000000000000000..9780886bc8f9d400aab2e96a33b14af980e64315
+index 0000000..4c50f57
 --- /dev/null
 +++ b/salttesting/ptest.py
-@@ -0,0 +1,168 @@
+@@ -0,0 +1,165 @@
 +# -*- coding: utf-8 -*-
 +
 +"""
@@ -158,10 +158,7 @@ index 0000000000000000000000000000000000000000..9780886bc8f9d400aab2e96a33b14af9
 +        self.descriptions = descriptions
 +
 +    def getDescription(self, test):
-+        if self.descriptions:
-+            return test.shortDescription() or str(test)
-+        else:
-+            return str(test)
++        return str(test)
 +
 +    def startTest(self, test):
 +        TestResult.startTest(self, test)
@@ -228,5 +225,5 @@ index 0000000000000000000000000000000000000000..9780886bc8f9d400aab2e96a33b14af9
 +        self.stream.writeln()
 +        return result
 -- 
-1.9.1
+2.13.2
 
-- 
2.7.4


