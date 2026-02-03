<!DOCTYPE html>
<html lang="ar">
<head>
<meta charset="UTF-8">
<title>⚽ كورة المغرب</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
:root{
  --green:#15803d;
  --red:#c1272d;
  --dark:#0b0f19;
  --card:#111827;
}

body{
  margin:0;
  font-family:"Cairo",Arial,sans-serif;
  background:var(--dark);
  color:#fff;
  direction:rtl;
}

header{
  background:linear-gradient(90deg,var(--green),var(--red));
  padding:15px;
  text-align:center;
  font-size:24px;
  font-weight:bold;
}

nav{
  background:#000;
  display:flex;
  justify-content:center;
  flex-wrap:wrap;
}

nav a{
  color:#fff;
  padding:10px 15px;
  text-decoration:none;
  font-weight:bold;
}

.hero{
  padding:50px 20px;
  text-align:center;
  background:
  linear-gradient(#000000cc,#000000cc),
  url("https://images.unsplash.com/photo-1508098682722-e99c43a406b2") center/cover;
}

.section{padding:20px;}
.section h2{
  border-right:5px solid var(--green);
  padding-right:10px;
}

.grid{
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
  gap:15px;
}

.card{
  background:var(--card);
  padding:15px;
  border-radius:12px;
  box-shadow:0 5px 15px #000;
}

.badge{
  background:red;
  padding:3px 8px;
  border-radius:5px;
  font-size:12px;
}

footer{
  background:#000;
  text-align:center;
  padding:15px;
  color:#aaa;
  font-size:14px;
}
a{color:#22c55e;text-decoration:none;}
</style>
</head>

<body>

<header>⚽ كورة المغرب</header>

<nav>
  <a href="#">الرئيسية</a>
  <a href="#">الأخبار</a>
  <a href="#">المباريات</a>
  <a href="#">الفيديوهات</a>
</nav>

<div class="hero">
  <h1>آخر أخبار ونتائج الكورة 🔥</h1>
  <p>المنتخب المغربي والدوريات العالمية</p>
</div>

<div class="section">
  <h2>📰 أخبار بالدارجة (AI)</h2>
  <div id="news" class="grid">
    <div class="card">جارٍ تحميل الأخبار...</div>
  </div>
</div>

<div class="section">
  <h2>🔴 مباريات وملخصات</h2>
  <div id="matches" class="grid">
    <div class="card">جارٍ تحميل المباريات...</div>
  </div>
</div>

<footer>
© 2026 كورة المغرب – ديما مغرب 🇲🇦
</footer>

<script>
// ===== AI دارجة محاكي =====
function aiDarija(text){
  let t = text
  .replace("vs","ضد")
  .replace("Highlights","ملخص")
  .replace("Goals","أهداف")
  .replace("Final","النهائي");

  const intros = [
    "ماتش سخون ودار ضجة:",
    "فمواجهة قوية،",
    "الكورة عطاتو عرض كبير:",
    "الفرجة كانت حاضرة حيث",
    "الماتش ما تعوّضش حيث"
  ];

  const ends = [
    "والجمهور تفرج حتى للآخر 🔥",
    "وكان الأداء فالمستوى ⚽",
    "والنتيجة حبسات الأنفاس 😮",
    "وشوف التفاصيل دابا 👇"
  ];

  return `${intros[Math.floor(Math.random()*intros.length)]}
  ${t}، ${ends[Math.floor(Math.random()*ends.length)]}`;
}

// ===== جلب البيانات =====
fetch("https://www.scorebat.com/video-api/v3/")
.then(res=>res.json())
.then(data=>{
  // الأخبار
  const news = document.getElementById("news");
  news.innerHTML="";
  data.response.slice(0,6).forEach(item=>{
    const card=document.createElement("div");
    card.className="card";
    card.innerHTML=`
      <strong>${aiDarija(item.title)}</strong>
      <p style="color:#aaa">${item.competition}</p>
      <a href="${item.matchviewUrl}" target="_blank">قرا التفاصيل ▶️</a>
    `;
    news.appendChild(card);
  });

  // المباريات
  const matches=document.getElementById("matches");
  matches.innerHTML="";
  data.response.slice(0,6).forEach(item=>{
    const card=document.createElement("div");
    card.className="card";
    card.innerHTML=`
      <strong>${item.title}</strong>
      <span class="badge">ملخص</span>
      <p style="color:#aaa">${item.competition}</p>
      <a href="${item.matchviewUrl}" target="_blank">شوف الفيديو ▶️</a>
    `;
    matches.appendChild(card);
  });
})
.catch(()=>{
  document.getElementById("news").innerHTML="<div class='card'>وقع مشكل فالتحميل</div>";
});
</script>

</body>
</html>
