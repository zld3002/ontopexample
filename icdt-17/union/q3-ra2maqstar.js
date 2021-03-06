db.awards1287.aggregate(
[
  // Duplication
  {$project: {
      "_id": false,
      "origDoc": "$$ROOT",
      "actDoc": [1, 2]
  }},
  {$unwind: "$actDoc"},
  // Specialization
  {$project: {
      "actDoc": true,
      "doc1": {$cond: {if: {$eq: ["$actDoc", 1]}, then: "$origDoc", else: "$dummy"}},
      "doc2": {$cond: {if: {$eq: ["$actDoc", 2]}, then: "$origDoc", else: "$dummy"}}
   }},
   // Sub-query 1
   {$match: {$or: [{"actDoc": {$ne: 1}}, {"doc1.awards": {$exists: true, $ne: null, $ne: []}}]}},
    {$unwind: {
        path: "$doc1.awards",
        preserveNullAndEmptyArrays: true
    }},
   {$project: {
      "actDoc": true,
      "doc2": true,
      "doc1.fn": "$doc1.name.first",
      "doc1.ln":  "$doc1.name.last",
      "doc1.an": "$doc1.awards.award",
      "doc1.ay": "$doc1.awards.year" 
    }},
   {$project: {
       "actDoc": true,
       "doc1": true,
       "doc2": true,
       "satCond": {$lt: ["$doc1.awards.year", 2000]}
   }},
   {$match: {"satCond": true}},
   // Sub-query 2
   {$match: {$or: [{"actDoc": {$ne: 2}}, {"doc2.awards": {$exists: true, $ne: null, $ne: []}}]}},
    {$unwind: {
        path: "$doc2.awards",
        preserveNullAndEmptyArrays: true
    }},
   {$project: {
       "actDoc": true,
       "doc1": true,
       "doc2": true,
       "satCond": {$gte: ["$doc2.awards.year", 2000]}
   }},
   {$match: {"satCond": true}},
   {$project: {
      "actDoc": true,
      "doc1": true,
      "doc2.fn": "$doc2.name.first",
      "doc2.ln":  "$doc2.name.last",
      "doc2.an": "$doc2.awards.award",
      "doc2.ay": "$doc2.awards.year" 
    }},
   // No normalization
   // Union
  {$project: {
      "doc1": true,
      "doc2": true,
      "fn": {$cond: {
          if: {$eq: ["$actDoc", 1]},
          then: "$doc1.fn",
          else: "$doc2.fn"
        }},
      "ln": {$cond: {
          if: {$eq: ["$actDoc", 1]},
          then: "$doc1.ln",
          else: "$doc2.ln"
        }},
      "an": {$cond: {
          if: {$eq: ["$actDoc", 1]},
          then: "$doc1.an",
          else: "$doc2.an"
        }},
      "ay": {$cond: {
          if: {$eq: ["$actDoc", 1]},
          then: "$doc1.ay",
          else: "$doc2.ay"
        }},        
    }},
  {$group: {
      _id: {
        "fn": "$fn",
        "ln": "$ln",
        "an": "$an",
        "ay": "$ay"  
      }
    }},
  {$project: {
      _id: false,
      "fn": "$_id.fn",
      "ln": "$_id.ln",
      "an": "$_id.an",
      "ay": "$_id.ay"  
    }}
]
)