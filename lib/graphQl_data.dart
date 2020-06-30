
class GraphqlData{

  static String newGame =
  r"""mutation insert_games($members: jsonb!, $scores: jsonb!, $name: String!, $slug: String!, $questions: jsonb!, $password: String!, $created_by: Int!) {
        insert_games(objects: [{created_by: $created_by, members: $members, type: "questions", scores: $scores, name: $name, slug:$slug, private: true, password:$password, questions: $questions, state: "waiting", round: {}
        }]) {
          affected_rows
          returning {
            id
          }
        }
      } """;

  /*
  variables: {
        members: [4, 9],
        scores: {},
        name: "dema2o",
        slug: "demao22sssdswdsdsdddd22",
        questions: [1, 3],
        password: "",
        created_by: 1
    }
   */

  static String submitGame =
      r"""mutation update_games($round: jsonb!, $id: Int!) {
        update_games(where: {id: {_eq: $id}},
            _append: {round :$round}
            ) {
          affected_rows
          returning {
            id
            scores
          }
        }
      }""";

  /*
  variables: {
    round: {id_4:4},
    id:15487
  }
   */

  static String readyGame =
      r"""mutation update_games($scores: jsonb!, $id: Int!) {
        update_games(where: {id: {_eq: $id}},
            _append: {scores :$scores}
            ) {
          affected_rows
          returning {
            id
            scores
          }
        }
      }""";

  /*
   variables: {
    scores: { id_9: 0, id_4: 0 },
    id: 15487,
  }
   */
}